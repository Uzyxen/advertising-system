<template>
    <ModalHeader>Umiejętności</ModalHeader>
    <div id="add-skill">
        <input type="text" placeholder="Nazwa umiejętności, np. HTML" v-model="newSkill">
        <button @click="addSkill">Dodaj</button>
    </div>

    <div id="skills">
        <TransitionGroup name="list">
            <UserSkill style="position: relative;" v-for="(skill, i) in skills" :key="i" :skill="skill.skill" :is-edit-mode="true" @delete-skill="deleteSkill(skill.skill_id)" />
        </TransitionGroup>
    </div>
</template>

<script setup>
    defineProps(['skills']);

    // emits
    const emit = defineEmits(['added', 'deleted']);

    // data
    const newSkill = ref();

    // functions
    async function addSkill() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/SetUserSkill.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'skill': newSkill.value } });

        if(response) {
            newSkill.value = '';

            emit('added', response);
        }
    }

    async function deleteSkill(id) {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/DeleteUserSkill.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': id } });

        if(response) {
            emit('deleted', response);
        }
    }
</script>

<style scoped>
    #skills {
        display: flex;
        flex-direction: column;
        gap: 5px;
        width: 100%;
        margin-top: -10px;
        position: relative;
    }

    #add-skill {
        display: flex;
        gap: 12px;
        width: 100%;
    }

    #add-skill input {
        flex: 1;
        border: 1px solid #DDD;
        outline: none;
        padding-left: 5px;
    }

    #add-skill button {
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