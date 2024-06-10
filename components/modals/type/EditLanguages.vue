<template>
    <ModalHeader>Języki</ModalHeader>

    <div id="content">
        <div>
            <input type="text" placeholder="Język" v-model="newLanguage.language">: 
            <SelectBox style="flex: 1;" 
                :source="[ { name: 'Ojczysty' }, { name: 'komunikatywny' }, { name: 'średnio-zaawansowany' }, { name: 'zaawansowany' }]"
                @selection-changed="(value) => newLanguage.level = value" />
        </div>

        <div style="flex-direction: column;">
            <div class="language" v-for="language in languages">
                <h4>{{ language.language }}</h4>

                <div class="close">
                    <h4>{{ language.level }}</h4>

                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" @click="deleteLanguage(language.language_id)">
                        <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                        <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                    </svg>
                </div>
            </div>
        </div>

        <PurpleButton style="align-self: flex-end; margin-top: 20px;" @button-clicked="addLanguage">Dodaj</PurpleButton>
    </div>
</template>

<script setup>
    defineProps(['languages']);
    const emit = defineEmits(['deleted', 'created']);

    const newLanguage = ref({
        language: '',
        level: ''
    });

    async function addLanguage() {
        if(newLanguage.value.   language !== '') {
            const response = await $fetch('http://localhost/advertising-system/backend/api/user/SetUserLanguage.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'data': newLanguage.value } });

            if(response) {
                emit('created', response);
            }
        }
    }

    async function deleteLanguage(id) {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/DeleteUserLanguage.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'id': id } });

        if(response) {
            emit('deleted', response);
        }
    }
</script>

<style scoped>
    #content {
        width: 100%;
        display: flex;
        flex-direction: column;
    }
    
    #content > div {
        width: 100%;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    input { 
        border: 1px solid var(--asc-bg-border);
        flex: 1;
        padding: 10px;
        height: 15px;
    }

    .language {
        width: calc(100% - 20px);
        display: flex;
        justify-content: space-between;
        background-color: #ddd;
        padding: 10px;
        color: var(--asc-txt-sec);
    }

    .close {
        display: flex;
        gap: 20px;
    }

    .language svg {
        width: 15px;
        cursor: pointer;
        fill: var(--asc-txt-sec);
    }

</style>