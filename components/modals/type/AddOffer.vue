<template>
    <ModalHeader>Dodaj ofertę</ModalHeader>

    <div id="content">
        <section>
            <h3>Tytuł: </h3>
            <input type="text" placeholder="tytuł">
        </section>
        
        <section>
            <h3>Opis: </h3>
            <textarea></textarea>
        </section>

        <section>
            <h3>Wynagrodzenie: </h3>
            <div id="salary">
                <input type="text">
                <span>-</span>
                <input type="text"> zł

                <span>/</span>

                <ComboBox :source="['miesiąc', 'godzinę']"/>
            </div>
        </section>

        <section>
            <h3>Kontrakt</h3>

            <ComboBox :source="['Kontrakt B2B', 'Umowa o pracę']" />
        </section>

        <section>
            <h3>Zakres obowiązków</h3>

            <div v-for="i in duties">
                {{ i }}<input type="text">
            </div>

            <button @click="duties++">Dodaj nowy</button>
        </section>

        <section>
            <h3>Wymagania</h3>

            <div v-for="i in requirements">
                {{ i }}<input type="text">
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
        gap: 20px;
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
</style>    