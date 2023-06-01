import { LightningElement } from 'lwc';

export default class P2cNonPrimitivesParent2 extends LightningElement {
    carouselInfo = [
        {
            src: "https://c.stocksy.com/a/EGA600/z9/1469414.jpg",
            header: "First Card",
            description: "First card description.",
            alternativeText: "First card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
            header: "Second Card",
            description: "Second card description.",
            alternativeText: "Second card accessible description.",
            href: "javascript:void(0);"
        },
        {
            src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
            header: "Third Card",
            description: "Third card description.",
            alternativeText: "Third card accessible description.",
            href: "javascript:void(0);"
        }
    ];
}