<template>
    <ModalHeader>Umiejętności</ModalHeader>
    <div id="add-skill">
        <input type="text" placeholder="Nazwa umiejętności, np. HTML" v-model="newSkill">
        <button>Dodaj</button>
    </div>

    <div id="skills">
        <UserSkill v-for="skill in skills" :skill="skill.umiejetnosc" :is-edit-mode="true"/>
    </div>
</template>

<script setup>
    defineProps(['skills']);

    // data
    const newSkill = ref();
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
</style>