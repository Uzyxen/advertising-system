<template>
    <ModalHeader>Dodaj ofertę</ModalHeader>

    <div id="content">
        <div>
            <h3>Tytuł: </h3>
            <input type="text" placeholder="tytuł">
        </div>
        
        <div>
            <h3>Opis: </h3>
            <textarea></textarea>
        </div>

        <div>
            <h3>Wynagrodzenie: </h3>
            <div>
                <input type="text">
                - 
                <input type="text"> zł

                / 
                <select>
                    <option>miesiąc</option>
                    <option>godzine</option>
                </select>
            </div>
        </div>

        <div>
            <h3>Kontrakt</h3>

            <select>
                <option>Kontrakt B2B</option>
                <option>Umowa o prace</option>
            </select>
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
    #content {
        width: 100%;
    }

    input {
        border: 1px solid #DDD;
    }
</style>    