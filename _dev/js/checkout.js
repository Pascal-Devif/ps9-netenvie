/**
 * 2007-2017 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 * International Registered Trademark & Property of PrestaShop SA
 */
import 'bootstrap/js/src/util';
import 'bootstrap/js/src/alert';
import 'bootstrap/js/src/button';

import 'bootstrap/js/src/dropdown';
import 'bootstrap/js/src/modal';
import 'bootstrap/js/src/popover';
import 'bootstrap/js/src/tab';
import 'bootstrap/js/src/toast';
import 'bootstrap/js/src/tooltip';
import 'bootstrap-touchspin';
import './lib/slick.min';
import './lib/jquery.hoverIntent.min';

//import  '../node_modules/jquery-zoom/jquery.zoom.min.js';


//import './checkout';
//import './customer';
//import './listing';
//import './product';


import './core';

function setUpCheckout() {

  // Delegate: payment step (and CGV link) is injected via AJAX after personal info / address / delivery
  $(document).on('click', '.js-terms a', (event) => {
    event.preventDefault();
    const $link = $(event.currentTarget);
    let url = $link.attr('href');

    const openTermsModal = () => {
      const $modal = $('#modal');
      $modal.modal('show');
      // Colissimo (and others) may replace $.fn.modal with Bootstrap 3,
      // which toggles `.in` while theme CSS (Bootstrap 4) only reveals with `.show`.
      $modal.addClass('show').css('display', 'block');
      $('.modal-backdrop').addClass('show');
    };

    if (url) {
      url += url.indexOf('?') >= 0 ? '&content_only=1' : '?content_only=1';
      $.get(url, (content) => {
        const $cms = $(content).find('.page-content--cms, .page-cms, #content.page-content');
        const html = $cms.length ? $cms.contents() : content;
        $('#modal').find('.js-modal-content').html(html);
        openTermsModal();
      }).fail((resp) => {
        prestashop.emit('handleError', {eventType: 'clickTerms', resp: resp});
      });
    } else {
      openTermsModal();
    }
  });

  $('.js-gift-checkbox').on('click', (event) => {
    $('#gift').collapse('toggle');
  });
}

$(document).ready(() => {
  if ($('body#checkout').length === 1) {
    setUpCheckout();
  }

  prestashop.on('updatedDeliveryForm', (params) => {
    if (typeof params.deliveryOption === 'undefined' || 0 === params.deliveryOption.length) {
        return;
    }
    // Hide all carrier extra content ...
    $(".carrier-extra-content").hide();
    // and show the one related to the selected carrier
    params.deliveryOption.next(".carrier-extra-content").slideDown();
  });
    prestashop.on('changedCheckoutStep', (params) => {

        if(typeof params.event.currentTarget !== 'undefined'){
            $('.collapse',params.event.currentTarget).not('.show').not('.collapse .collapse').collapse('show');
        }
    });

});

$(document).on('change','.js-input-delivery:checked', (event) => {
    $('.js-label-delivery.selected').removeClass('selected');
    $('#js-'+$(this).attr('id')).addClass('selected');
});

$(document).on('click','.js-checkout-step-header', (event) => {
    // Prefer section id: template has no data-identifier; Colissimo replaces
    // Bootstrap 4 collapse with BS3 which toggles `.in` while theme CSS needs `.show`.
    const $header = $(event.currentTarget);
    const $step = $header.closest('.checkout-step');
    const stepId = $step.attr('id');
    if (!stepId) {
      return;
    }
    const $content = $(`#content-${stepId}`);
    $step.addClass('-current');
    // Close sibling step panels (mix of BS3 `.in` and BS4 `.show`)
    $('#js-checkout-process > .checkout-step > .collapse')
      .not($content)
      .removeClass('show in')
      .css('height', '')
      .css('display', 'none');
    $content.addClass('show in').css('display', 'block').css('height', '');
    $header.attr('aria-expanded', 'true');
});

// Keep `.show` in sync when Bootstrap (3 or 4) collapse API fires
$(document).on('show.bs.collapse', '#js-checkout-process > .checkout-step > .collapse', (event) => {
    const $content = $(event.target);
    $('#js-checkout-process > .checkout-step > .collapse')
      .not($content)
      .removeClass('show in')
      .css('display', 'none');
    $content.addClass('show');
});
$(document).on('hide.bs.collapse', '#js-checkout-process > .checkout-step > .collapse', (event) => {
    $(event.target).removeClass('show');
});


