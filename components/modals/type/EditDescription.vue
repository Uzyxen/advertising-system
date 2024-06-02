<template>
    <ModalHeader>
        <slot />
    </ModalHeader>

    <textarea spellcheck="false" v-model="newDescription"></textarea>

    <ModalSaveButton @button-clicked="saveDescription">Zapisz</ModalSaveButton>
</template>

<script setup>
    const props = defineProps(['description', 'isCompany']);
    const newDescription = ref(props.description);

    // emits 
    const emit = defineEmits(['saved']);

    // functions
    async function saveDescription() {
        let response;

        if(props.isCompany) {
            response = await $fetch('http://localhost/advertising-system/backend/api/company/UpdateDescription.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'description': newDescription.value } });
        } else {
            response = await $fetch('http://localhost/advertising-system/backend/api/user/UpdateDescription.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'description': newDescription.value } });
        }

        if(response) {
            emit('saved', response);
        }
    }
</script>

<style scoped>
    textarea {
        resize: none;
        border: 1px solid #DDD;
        outline: none;
        position: relative;
        width: calc(100% - 20px);
        margin: 0 25px;
        height: 400px;
        font-size: 16px;
        overflow-y: auto;
        border-radius: 2px;
        padding: 5px 10px;
        color: #676071;
    }
</style>