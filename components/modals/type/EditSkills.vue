<template>
    <ModalHeader>Umiejętności</ModalHeader>
    <div id="add-skill">
        <input type="text" placeholder="Nazwa umiejętności, np. HTML" v-model="newSkill">
        <button @click="addSkill">Dodaj</button>
    </div>

    <div id="skills">
        <TransitionGroup name="list">
            <UserSkill v-for="(skill, i) in skills" :key="i" :skill="skill.skill" :is-edit-mode="true"/>
        </TransitionGroup>
    </div>
</template>

<script setup>
    defineProps(['skills']);

    // emits
    const emit = defineEmits(['added']);

    // data
    const newSkill = ref();

    // functions
    async function addSkill() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/SetUSerSkill.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'skill': newSkill.value } });

        if(response) {
            emit('added', response);
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

    .list-enter-active,
    .list-leave-active {
        transition: all 0.5s ease;
    }

    .list-enter-from,
    .list-leave-to {
        opacity: 0;
        transform: translateX(30px);
    }
</style>