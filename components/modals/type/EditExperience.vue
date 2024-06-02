<template>
    <ModalHeader>Doświadczenie</ModalHeader>

    <div id="content">
        <UserExperience v-for="experienceBlock in experience" :experience="experienceBlock" :is-edit-mode="true" :empty="false"/>

        <h4>
            <span>
                Dodaj nowe
            </span>
        </h4>

        <UserExperience :experience="null" :is-edit-mode="true"/>
    </div>
</template>

<script setup>
    defineProps(['experience']);
</script>

<style scoped>
    #content {
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
    }
</style>