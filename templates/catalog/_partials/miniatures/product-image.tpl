{block name='product_miniature_image'}
  {if $product.cover}
    <picture>
      {if isset($product.cover.bySize.pdt_300.sources.avif)}
        <source
          srcset="
            {$product.cover.bySize.pdt_180.sources.avif} 216w,
            {$product.cover.bySize.pdt_300.sources.avif} 261w,
            {$product.cover.bySize.pdt_360.sources.avif} 336w"
          sizes="(min-width: 992px) 25vw, (min-width: 360px) 50vw, 100vw"
          type="image/avif"
        >
      {/if}

      {if isset($product.cover.bySize.pdt_300.sources.webp)}
        <source
          srcset="
            {$product.cover.bySize.pdt_180.sources.webp} 216w,
            {$product.cover.bySize.pdt_300.sources.webp} 261w,
            {$product.cover.bySize.pdt_360.sources.webp} 336w"
          sizes="(min-width: 992px) 25vw, (min-width: 360px) 50vw, 100vw"
          type="image/webp"
        >
      {/if}

      <img
        class="lazyload"
        srcset="
          {$product.cover.bySize.pdt_180.url} 216w,
          {$product.cover.bySize.pdt_300.url} 261w,
          {$product.cover.bySize.pdt_360.url} 336w"
        sizes="(min-width: 992px) 25vw, (min-width: 360px) 50vw, 100vw"
        src="{$product.cover.bySize.pdt_300.url}"
        width="{$product.cover.bySize.pdt_300.width}"
        height="{$product.cover.bySize.pdt_300.height}"
        loading="lazy"
        alt="{$product.cover.legend}"
        title="{$product.cover.legend}"
        data-full-size-image-url="{$product.cover.bySize.home_default.url}"
      >
    </picture>
  {else}
    <picture>
      {if isset($urls.no_picture_image.bySize.pdt_300.sources.avif)}
        <source
          srcset="
            {$urls.no_picture_image.bySize.pdt_180.sources.avif} 216w,
            {$urls.no_picture_image.bySize.pdt_300.sources.avif} 261w,
            {$urls.no_picture_image.bySize.pdt_360.sources.avif} 336w"
          sizes="(min-width: 992px) 25vw, (min-width: 360px) 50vw, 100vw"
          type="image/avif"
        >
      {/if}

      {if isset($urls.no_picture_image.bySize.pdt_300.sources.webp)}
        <source
          srcset="
            {$urls.no_picture_image.bySize.pdt_180.sources.webp} 216w,
            {$urls.no_picture_image.bySize.pdt_300.sources.webp} 261w,
            {$urls.no_picture_image.bySize.pdt_360.sources.webp} 336w"
          sizes="(min-width: 992px) 25vw, (min-width: 360px) 50vw, 100vw"
          type="image/webp"
        >
      {/if}

      <img
        class="lazyload"
        srcset="
          {$urls.no_picture_image.bySize.pdt_180.url} 216w,
          {$urls.no_picture_image.bySize.pdt_300.url} 261w,
          {$urls.no_picture_image.bySize.pdt_360.url} 336w"
        sizes="(min-width: 992px) 25vw, (min-width: 360px) 50vw, 100vw"
        width="{$urls.no_picture_image.bySize.pdt_300.width}"
        height="{$urls.no_picture_image.bySize.pdt_300.height}"
        src="{$urls.no_picture_image.bySize.pdt_300.url}"
        loading="lazy"
        alt="{l s='No image available' d='Shop.Theme.Catalog'}"
        title="{l s='No image available' d='Shop.Theme.Catalog'}"
        data-full-size-image-url="{$urls.no_picture_image.bySize.home_default.url}"
      >
    </picture>
  {/if}
{/block}
