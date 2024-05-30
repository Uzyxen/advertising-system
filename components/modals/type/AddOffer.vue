<template>
    <ModalHeader>Dodaj ofertę</ModalHeader>

    <div id="content">
        <section>
            <h3>Kategoria: </h3>
            
            <SelectBox :source="['IT', 'Marketing', 'Praca zdalna']"/>
        </section>

        <section>
            <h3>Tytuł: </h3>
            <input type="text" placeholder="tytuł">
        </section>
        
        <section>
            <h3>Opis: </h3>
            <textarea placeholder="opis"></textarea>
        </section>

        <section>
            <h3>Poziom stanowiska</h3>

            <SelectBox :source="['pracownik fizyczny', 'prezes']"/>
        </section>

        <section>
            <h3>Wynagrodzenie: </h3>
            <div id="salary">
                <input type="text">
                <span>-</span>
                <input type="text"> zł

                <span>/</span>

                <SelectBox :source="['miesiąc', 'godzinę']"/>
            </div>
        </section>

        <section>
            <h3>Kontrakt</h3>

            <SelectBox :source="['Kontrakt B2B', 'Umowa o pracę']" />
        </section>

        <section>
            <h3>Zakres obowiązków</h3>

            <div v-for="i in duties">
                <div class="duty">
                    <span>{{ i }}.</span>
                    <input type="text">

                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                        <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                    </svg>
                </div>
            </div>

            <button @click="duties++">Dodaj nowy</button>
        </section>

        <section>
            <h3>Wymagania</h3>

            <div v-for="i in requirements">
                <div class="requirement">
                    <span>{{ i }}.</span>
                    <input type="text">

                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                        <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                    </svg>
                </div>
            </div>

            <button @click="requirements++">Dodaj nowy</button>
        </section>
    </div>
</template>

<script setup>
    const duties = ref(0);
    const requirements = ref(0);
</script>

<style scoped>
    #content {
        width: 100%;
        max-height: 500px;
        overflow-y: auto;
        padding: 0 10px;
        display: flex;
        flex-direction: column;
        gap: 30px;
    }

    input {
        border: 1px solid #DDD;
        width: calc(100% - 20px);
        padding: 10px;
    }

    textarea {
        border: 1px solid #DDD;
        outline: none;
        resize: none;
        height: 200px;
    }

    h3 {
        font-size: 20px;
    }

    section {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    #salary {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .duty, .requirement {
        display: flex;
        gap: 5px;
        align-items: center;
        position: relative;
    }

    .duty span, .requirement span {
        width: 20px;
    }

    .duty svg, .requirement svg {
        position: absolute;
        width: 15px;
        right: 10px;
        cursor: pointer;
        fill: #231D2B;
        transition: fill .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .duty svg:hover, .requirement svg:hover {
        fill: #F44534;
    }


    button {
        font-size: 16px;
        background-color: #eee;
        padding: 10px;
        cursor: pointer;
    }

    button:hover {
        background-color: #ddd;
    }
</style>    