{**
 * Affiche TTC / HT selon le groupe client.
 * Activé via theme.yml → theme_settings.display_product_tax_label
 *}
{if !empty($display_product_tax_label) && $configuration.taxes_enabled}
  <span class="tax-label">{strip}
    {if isset($product.labels.tax_long) && $product.labels.tax_long}
      {$product.labels.tax_long}
    {elseif isset($cart.labels.tax_long) && $cart.labels.tax_long}
      {$cart.labels.tax_long}
    {elseif $configuration.display_prices_tax_incl}
      {l s='Tax included' d='Shop.Theme.Global'}
    {else}
      {l s='Tax excluded' d='Shop.Theme.Global'}
    {/if}
  {/strip}</span>
{/if}
