<template>
    <footer>
        <div id="root">
            <div id="footer-root">
                <div class="accordion">
                    <h2>Dla Kandydatów</h2>

                    <div>
                        <a href="">Szukaj ogłoszeń</a>
                        <a href="">Zaoferuj się</a>
                        <a href="">Pomoc</a>
                        <a href="">Pomoc dla firm</a>
                    </div>
                </div>

                <div class="accordion">
                    <h2>Dla Firm</h2>

                    <div>
                        <a href="">Dodaj ogłoszenie</a>
                        <a href="">Szukaj kandydatów</a>
                        <a href="">Konto pracodawcy</a>
                        <a href="">Pomoc dla firm</a>
                    </div>
                </div>

                <div class="accordion">
                    <h2>Narzędzia</h2>

                    <div>
                        <a href="">Kreator CV</a>
                        <a href="">Porównywanie ofert</a>
                        <a href="">Blog</a>
                    </div>
                </div>

                <div class="accordion">
                    <h2>Zaobserwuj nas</h2>

                    <div id="social-media">
                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. --><path d="M80 299.3V512H196V299.3h86.5l18-97.8H196V166.9c0-51.7 20.3-71.5 72.7-71.5c16.3 0 29.4 .4 37 1.2V7.9C291.4 4 256.4 0 236.2 0C129.3 0 80 50.5 80 159.4v42.1H14v97.8H80z"/></svg>
                        </div>

                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. --><path d="M448 209.9a210.1 210.1 0 0 1 -122.8-39.3V349.4A162.6 162.6 0 1 1 185 188.3V278.2a74.6 74.6 0 1 0 52.2 71.2V0l88 0a121.2 121.2 0 0 0 1.9 22.2h0A122.2 122.2 0 0 0 381 102.4a121.4 121.4 0 0 0 67 20.1z"/></svg>
                        </div>

                        <div>
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. --><path d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="line"></div>

            <div id="footer-bottom">
                <div>Moltaro &copy;</div>

                <div id="footer-bottom-right">
                    <a href="">Regulamin</a>
                    <a href="">Polityka Prywatności</a>
                    <a href="">Polityka plików cookies</a>
                    <a href="">Kontakt</a>
                </div>
            </div>
        </div>

    </footer>
</template>

<script setup>

</script>

<style scoped>
    footer{
        display: flex;
        box-shadow: 0 0 12px rgb(0 0 0 / 8%);
        padding: 20px;
        color: #231d2b;
        flex-direction: column;
        background-color: #fff;
        z-index: 1;
        position: relative;
        margin-top: 50px;
    }

    #root{
        margin: 0 auto;
    }

    #footer-root{
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        column-gap: 150px;
    }

    footer div.accordion{
        display: flex;
        flex-direction: column;
    }

    .accordion h2{
        font-weight: 700;
        text-align: left;
        padding: 15px 0;
        font-size: 24px;
        position: relative;
        white-space: nowrap;
    }

    .accordion h2::before{
        content: '';
        position: absolute;
        left: 0;
        bottom: 5px;
        width: 30%;
        height: 3px;
        background-color: #6244DB;
    }
    .accordion h2 + div{
        padding-top: 25px;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    a{
        font-size: 14px;
        color: #231d2b;
        white-space: nowrap;
    }

    #social-media{
        display: flex;
        flex-direction: row;
    }

    #social-media div{
        border-radius: 50px;
        width: 30px;
        height: 30px;
        background-color: rgb(31, 41, 55);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #social-media div svg{
        width: 18px;
        height: 17px;
        fill: #fff;
    }

    #line{
        background-color: #DDD;
        height: 1px;
        width: 100%;
        margin-top: 80px;
    }

    #footer-bottom{
        display: flex;
        justify-content: space-between;
        padding: 40px 0 20px;
    }

    #footer-bottom-right{
        display: flex;
        gap: 25px;
    }

    a{
        text-decoration: none;
    }

</style>