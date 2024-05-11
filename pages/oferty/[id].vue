<template>
    <div id="main">
        <div id="main-top">
            <div id="offer-detail">
                <div id="image">
                    <img src="/company/gizlomar.png" alt="Logo firmy">
                </div>

                <div id="offer-title">
                    <div>
                        <h2 id="title">vuejs developer</h2>
                        <a id="company" href>Gizlomar</a>
                    </div>
                </div>
            </div>
        </div>

        <div id="main-content">
            <div id="content-left">
                <div id="description">
                    <h2 class="header">Opis</h2>
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
                    <h2 class="header">Zakres obowiązków</h2>
                    <hr>

                    <div>
                        <p v-for="duty in duties">
                            {{ duty.title }}
                        </p>
                    </div>
                </div>

                <div id="requirements">
                    <h2 class="header">Wymagania</h2>
                    <hr>

                    <div>
                        <p v-for="requirment in requirements">
                            {{ requirment.title }}
                        </p>
                    </div>
                </div>
            </div>

            <div id="offer-action">
                <h2>12 000 - 16 000 zł / mies.</h2>
                <h3>Umowa B2B</h3>

                <PurpleButton>Aplikuj</PurpleButton>
                <h3 id="ask-question">Zapytaj o ogłoszenie</h3>
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
        padding: 0 300px;
        background-color: #f1f5f9;
    }

    #offer-detail {
        width: 100%;
        display: flex;
        align-items: center;
    }

    #image {
        width: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #image img {
        border-radius: 2px;
        width: 140px;
        height: 140px;
    }

    #offer-title {
        width: 100%;
        display: flex;
        height: 100px;
    }

    #offer-title > div {
        display: flex;
        flex-direction: column;
        gap: 5px;
        padding: 0 22px;
    }

    h2#title {
        color: var(--asc-txt-sec);
        font-size: 38px;
        font-weight: 600;
    }

    a#company {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
        font-size: 18px;
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
        min-height: 500px;
        background-color: var(--asc-bg-alt);
        display: flex;
        width: calc(100% - 600px);
        padding: 40px 300px;
        gap: 22px;
    }

    #main-content h2.header {
        display: inline-block;
        color: var(--asc-txt-sec);
        font-size: 25px;
        margin: 22px 0 13px;
    }

    #content-left {
        flex: 1;
    }

    #offer-action {
        display: flex;
        flex-direction: column;
        gap: 10px;
        height: 300px;
    }

    p {
        margin: 22px 13px;
        line-height: 150%;
        color: var(--asc-txt-sec);
    }
</style>