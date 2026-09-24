{**
 * Libellé taxe court (TTC/HT) pour totaux panier.
 * Si aucune taxe n'est appliquée au panier, force HT même pour un groupe TTC.
 *}
{strip}
  {if isset($cart.subtotals.tax.amount) && $cart.subtotals.tax.amount|floatval == 0}
    {l s='(tax excl.)' d='Shop.Theme.Global'}
  {elseif isset($cart.totals.total_including_tax.amount) && isset($cart.totals.total_excluding_tax.amount) && $cart.totals.total_including_tax.amount|floatval == $cart.totals.total_excluding_tax.amount|floatval}
    {l s='(tax excl.)' d='Shop.Theme.Global'}
  {elseif isset($cart.labels.tax_short) && $cart.labels.tax_short}
    {$cart.labels.tax_short}
  {elseif $configuration.display_prices_tax_incl}
    {l s='(tax incl.)' d='Shop.Theme.Global'}
  {else}
    {l s='(tax excl.)' d='Shop.Theme.Global'}
  {/if}
{/strip}
