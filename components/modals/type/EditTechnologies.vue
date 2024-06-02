<template>
    <ModalHeader>Technologie</ModalHeader>
    <div id="add-technology">
        <input type="text" placeholder="Nazwa technologii, np. PHP" v-model="newTechnology">
        <button @click="addTechnology">Dodaj</button>
    </div>

    <div id="technologies">
        <TransitionGroup name="list">
            <UserSkill style="position: relative;" v-for="(technology, i) in technologies" :key="i" :skill="technology.technology" :is-edit-mode="true" @delete-skill="deleteTechnology(technology.technology_id)" />
        </TransitionGroup>
    </div>
</template>

<script setup>
    defineProps(['technologies']);

    // emits
    const emit = defineEmits(['added', 'deleted']);

    // data
    const newTechnology = ref();

    // functions
    async function addTechnology() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/company/SetCompanyTechnology.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'technology': newTechnology.value } });

        if(response) {
            newTechnology.value = '';

            emit('added', response);
        }
    }

    async function deleteTechnology(id) {
        const response = await $fetch('http://localhost/advertising-system/backend/api/company/DeleteCompanyTechnology.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': id } });

        if(response) {
            emit('deleted', response);
        }
    }
</script>

<style scoped>
    #technologies {
        display: flex;
        flex-direction: column;
        gap: 5px;
        width: 100%;
        margin-top: -10px;
        position: relative;
    }

    #add-technology {
        display: flex;
        gap: 12px;
        width: 100%;
    }

    #add-technology input {
        flex: 1;
        border: 1px solid #DDD;
        outline: none;
        padding-left: 5px;
    }

    #add-technology button {
        width: 150px;
        padding: 12px 15px;
        cursor: pointer;
        font-size: 15px;
        background-color: #6244DB;
        color: #FFF;
    }

    .list-move,
    .list-enter-active,
    .list-leave-active {
        transition: all 0.5s ease;
    }

    .list-enter-from,
    .list-leave-to {
        opacity: 0;
        transform: translateX(30px);
    }

    .list-leave-active {
        position: absolute;
    }
</style>