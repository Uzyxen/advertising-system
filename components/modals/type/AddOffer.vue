<template>
    <div class="wrapper" v-if="response === false">
        <ModalHeader>Dodaj ofertę</ModalHeader>

        <div id="content">
            <section>
                <h3>Kategoria: </h3>
                
                <SelectBox :source="jobCategories" @selectionChanged="(value) => { offerData.category = value }"/>
            </section>

            <section>
                <h3>Tytuł: </h3>
                <input type="text" placeholder="Tytuł" v-model="offerData.title">
            </section>
            
            <section>
                <h3>Opis: </h3>
                <textarea placeholder="Opis" v-model="offerData.description"></textarea>
            </section>

            <section>
                <h3>Poziom stanowiska</h3>

                <SelectBox :source="jobLevels" @selectionChanged="(value) => { offerData.level = value }"/>
            </section>

            <section>
                <h3>Wynagrodzenie: </h3>
                <div id="salary">
                    <input type="text" v-model.number="offerData.salaryMin">
                    <span>-</span>
                    <input type="text" v-model.number="offerData.salaryMax"> zł

                    <span>/</span>

                    <SelectBox :source="[{ name: 'miesiąc' }, { name: 'godzinę' }]" @selectionChanged="(value) => { offerData.frequency = value }" />
                </div>
            </section>

            <section>
                <h3>Kontrakt</h3>

                <SelectBox :source="contractTypes" @selectionChanged="(value) => { offerData.contractType = value }" />
            </section>

            <section>
                <h3>Lokalizacja</h3>

                <input type="text" placeholder="Lokalizacja" v-model="offerData.location">
            </section>

            <section>
                <h3>Zakres obowiązków</h3>

                <div v-for="(duty, i) in offerData.duties" :key="i">
                    <div class="duty">
                        <span>{{ i + 1 }}.</span>
                        <input type="text" v-model="duty.text">

                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                            <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                        </svg>
                    </div>
                </div>

                <button @click="offerData.duties.push({ text: '' })">Dodaj nowy</button>
            </section>

            <section>
                <h3>Wymagania</h3>

                <div v-for="(requirement, i) in offerData.requirements">
                    <div class="requirement">
                        <span>{{ i + 1 }}.</span>
                        <input type="text" v-model="requirement.text">

                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                            <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                        </svg>
                    </div>
                </div>

                <button @click="offerData.requirements.push({ text: '' })">Dodaj nowy</button>
            </section>

            <ModalSaveButton @buttonClicked="createOffer">Dodaj</ModalSaveButton>
        </div>
    </div>

    <div class="wrapper" v-else>
        <SuccessAnimatedMark style="margin-top: 80px;" />

        <h2 id="success-header">Pomyślnie dodano!</h2>
    </div>
</template>

<script setup>
    // fetch from db
    const { data: jobCategories } = await useFetch('http://localhost/advertising-system/backend/api/job/GetJobCategories.php', { responseType: 'json', method: 'post' });
    const { data: jobLevels } = await useFetch('http://localhost/advertising-system/backend/api/job/GetJobLevels.php', { responseType: 'json', method: 'post' });
    const { data: contractTypes } = await useFetch('http://localhost/advertising-system/backend/api/job/GetContractTypes.php', { responseType: 'json', method: 'post' });

    // data

    const offerData = ref({
        category: '',
        level: '',
        frequency: '',
        contractType: '',
        title: '',
        description: '',
        salaryMin: '',
        salaryMax: '',
        location: '',
        duties: [
            { text: '' }
        ],
        requirements: [
            { text: '' }
        ]
    });

    const response = ref(false);

    // functions

    function validate() {
        return true;
    }

    async function createOffer() {
        if(validate()) {
            response.value = await $fetch('http://localhost/advertising-system/backend/api/offer/CreateOffer.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'data': offerData.value } });
        }
    }

    function removeItem(id) {

    }
</script>

<style scoped>
    .wrapper {
        display: flex;
        flex-direction: column;
        width: 100%;
        gap: 20px;
    }

    #success-header {
        text-align: center;
        padding-bottom: 20px;
        font-size: 25px;
    }

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
        font-size: 16px;
    }

    textarea {
        border: 1px solid #DDD;
        outline: none;
        resize: none;
        height: 200px;
        font-size: 16px;
        padding: 10px;
    }

    h3 {
        font-size: 20px;
    }

    section {
        display: flex;
        flex-direction: column;
        gap: 10px;
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

    .duty input, .requirement input {
        padding-right: 30px;
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

    section button {
        font-size: 16px;
        background-color: #eee;
        padding: 10px;
        cursor: pointer;
    }

    section button:hover {
        background-color: #ddd;
    }
</style>    