{**
 * Affiche TTC / HT selon le groupe client, et selon la localisation (taux réel).
 * Activé via theme.yml → theme_settings.display_product_tax_label
 * Respecte display_taxes_label (réglage pays).
 * Si le taux de taxe du contexte (pays/adresse) est 0, affiche HT même pour un groupe TTC.
 *}
{if !empty($display_product_tax_label) && $configuration.taxes_enabled && $configuration.display_taxes_label}
  <span class="tax-label">{strip}
    {if isset($tax_label) && $tax_label}
      {$tax_label}
    {elseif isset($product.rate) && $product.rate|floatval == 0}
      {l s='Tax excluded' d='Shop.Theme.Global'}
    {elseif isset($product.labels.tax_long) && $product.labels.tax_long}
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
