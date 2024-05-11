<template>
    <div id="main">
        <div id="background-baner"></div>
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
            <div id="description">
                <h2>Opis</h2>
                <hr>

                <p>
                    Lorem Ipsum is simply dummy text of the printing and typesetting industry. 
                    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it 
                    to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. 
                    It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software 
                    like Aldus PageMaker including versions of Lorem Ipsum.
                </p>
            </div>

            <div id="duties">
                <h2>Zakres obowiązków</h2>
                <hr>

                <div>
                    <p v-for="duty in duties">
                        {{ duty.title }}
                    </p>
                </div>
            </div>

            <div id="requirements">
                <h2>Wymagania</h2>
                <hr>

                <div>
                    <p v-for="requirment in requirements">
                        {{ requirment.title }}
                    </p>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const duties = ref([
        { title: 'Inicjowanie i utrzymywanie współpracy z firmami na podległym terenie' },
        { title: 'Realizacja planów sprzedażowych firmy' },
        { title: 'Budowa wizerunku firmy na powierzonym terenie działania' } 
    ]);

    const requirements = ref([
        { title: 'Bardzo dobra znajomość Vue2/Vue3.' },
        { title: 'Minimum 2-letnie doświadczenie w pracy na podobnym stanowisku.' },
        { title: 'Umiejętność rozwiązywania złożonych problemów projektowych przy użyciu logicznego i kreatywnego podejścia.' } 
    ]);
</script>

<style scoped>
    #main {
        display: flex;
        flex-direction: column;
        justify-content: center;
        margin: 50px 300px;
    }

    #background-baner {
        width: 100%;
        height: 300px;
        background-color: #6244DB;
        position: absolute;
        left: 0;
        top: 0;
        z-index: -1;
        background-image: url('steps.svg');
    }

    hr {
        background-color: #DDD;
        height: 1px;
        border: none;
        margin: 0;
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
        width: calc(100% - 2px);
        min-height: 500px;
        padding-top: 10px;
        background-color: var(--asc-bg-alt);
        border: 1px solid #DDD;
        border-top: none;
    }

    #main-content h2 {
        display: inline-block;
        color: var(--asc-txt-sec);
        font-size: 25px;
        margin: 22px 0 13px 22px;
    }

    p {
        margin: 22px 13px;
        line-height: 150%;
        color: var(--asc-txt-sec);
    }
</style>