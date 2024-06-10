<template>
    <ModalHeader>Doświadczenie</ModalHeader>

    <div id="content-inner" v-if="!isAdding">
        <UserExperience :is-edit-mode="true"/>

        <h4>
            <span>
                Dodaj nowe
            </span>
        </h4>

        <div id="add-new" @click="isAdding = true">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>
            </svg>
        </div>
    </div>

    <div id="content-inner-add" v-else>
        <div id="flex-wrapper">
            <div style="display: flex; align-items: center; gap: 10px;">
                <input type="date" v-model="newExperience.date_start"> - <input type="date" v-model="newExperience.date_end">
            </div>

            <input type="text" placeholder="Stanowisko" v-model="newExperience.position">
            <textarea placeholder="Opis" v-model="newExperience.description"></textarea>
            <input type="text" placeholder="Firma" v-model="newExperience.company">
            <input type="text" placeholder="Lokalizacja" v-model="newExperience.location">
        </div>

        <div style="display: flex; gap: 10px; align-self: flex-end; margin-top: 30px;">
            <ColorButton @button-clicked="isAdding = false" :background-color="'#ff3333'">Anuluj</ColorButton>
            <PurpleButton @button-clicked="addExperience">Zapisz</PurpleButton>
        </div>
    </div>
</template>

<script setup>
    defineProps(['experience']);

    const isAdding = ref(false);

    const newExperience = ref({
        date_start: '',
        date_end: '',
        position: '',
        description: '',
        company: '',
        location: '',
    });

    async function addExperience() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/SetUserExperience.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'data': newExperience.value } });

        if(response) {
            isAdding.value = false;
        }
    }
</script>

<style scoped>
    #content-inner {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    h4 {
        font-size: 20px;
        width: 100%; 
        text-align: center; 
        border-bottom: 2px solid var(--asc-txt-ui-sec); 
        line-height: 0.1em;
        margin: 15px 0; 
    } 


    h4 span { 
        background: #fff; 
        padding: 0 10px; 
        color: var(--asc-txt-ui-sec)
    }

    #add-new {
        border: 1px solid #DDD;
        height: 150px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #add-new:hover {
        background-color: #eee;
    }

    #add-new svg {
        width: 20%;
        fill: var( --asc-txt-sec);
    }

    #content-inner-add {
        width: 100%;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    #flex-wrapper {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    input, textarea {
        border: 1px solid var(--asc-bg-border);
        padding: 10px;
    }

    input[type='date'] {
        flex: 1;
    }

    textarea {
        outline: none;
        resize: none;
    }
</style>