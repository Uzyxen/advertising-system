<template>
    <div id="main">
        <div id="main-top">
            <div id="offer-detail">
                <div id="image">
                    <img src alt>
                </div>

                <div id="offer-title">
                    <div>
                        <h2 id="title">vuejs developer</h2>
                        <a id="company" href>Gizlomar</a>
                    </div>

                    <div>
                        <h2>12 000 - 16 000 zł / mies.</h2>
                        <h3>Umowa B2B</h3>
                    </div>
                </div>

                <div id="offer-action">
                    <PurpleButton>Aplikuj</PurpleButton>
                    <h3 id="ask-question">Zapytaj o ogłoszenie</h3>
                </div>
            </div>
        </div>

        <div id="main-content">

        </div>
    </div>
</template>

<script setup>
    
</script>

<style scoped>
    #main {
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 22px;
        padding: 50px 250px;
    }

    #main-top {
        display: flex;
        gap: 22px;
        height: 200px;
        justify-content: center;
        border: 1px solid #DDD;
    }

    #offer-detail {
        width: 100%;
        padding: 0 30px;
        display: flex;
        align-items: center;
        background-color: var(--asc-bg-alt);
    }

    #image {
        width: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #image img {
        border-radius: 2px;
        width: 100px;
        height: 100px;
        border: 1px solid #DDD;
    }

    #offer-title {
        width: 100%;
        display: flex;
        justify-content: space-between;
        border-right: 1px solid #DDD;
        height: 100px;
        padding-right: 22px;
    }

    #offer-title > div {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    #offer-action {
        display: flex;
        flex-direction: column;
        gap: 10px;
        padding-left: 22px;
        height: 100px;
        width: 300px;
        background-color: var(--asc-bg-alt);
    }

    h2#title {
        color: var(--asc-txt-sec);
    }

    a#company {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
        font-size: 15px;
        width: fit-content;
    }

    a#company:hover {
        text-decoration: underline;
    }

    h3#ask-question {
        color: var(--asc-txt-ui-sec);
        font-weight: 500;
        font-size: 15px;
    }

    #main-content {
        width: 100%;
        height: 500px;
        background-color: var(--asc-bg-alt);
        border: 1px solid #DDD;
    }
</style>