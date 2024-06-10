<template>
    <div class="experience-block" :class="{ edit: isEditMode }">
        <div class="delete" @click="deleteExperience">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" v-if="isEditMode">
                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3zM32 128H416V448c0 35.3-28.7 64-64 64H96c-35.3 0-64-28.7-64-64V128zm96 64c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16z"/>
            </svg>
        </div>

        <div class="header">
            <span>
                {{ experience.data_poczatek }}
            </span>
            - 
            <span>
                {{ experience.data_koniec }}
            </span>
        </div>
        <div class="info">
            <h3>
                {{ experience.stanowisko }}
            </h3>

            <p>
                {{ experience.opis }}
            </p>
        </div>

        <hr>

        <div class="company-location" v-if="experience">
            {{ experience.firma }}
            <div class="dot"></div>
            {{ experience.lokalizacja }}
        </div>
    </div>
</template>

<script setup>
    const props = defineProps(['experience', 'isEditMode']);
    const emit = defineEmits(['deleted']);

    async function deleteExperience() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/DeleteUserExperience.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'id': props.experience.doswiadczenie_id } });

        emit('deleted', response);
    }
</script>

<style scoped>
    .experience-block {
        display: flex;
        width: 370px;
        height: 150px;
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        background-color: #FFF;
        flex-direction: column;
    }

    .experience-block.edit {
        width: 100%;
        cursor: pointer;
        position: relative;
    }

    .experience-block.edit .delete {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        transition: opacity .3s cubic-bezier(0.24,0.07,0.09,0.99), background-color .3s cubic-bezier(0.24,0.07,0.09,0.99);
        opacity: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .experience-block.edit:hover .delete {
        opacity: 0.9;
        background-color: #dddddd69;
    }

    .experience-block.edit .delete svg {
        position: absolute;
        height: 60%;
        fill: var(--asc-txt-sec);
    }

    .experience-block.edit:hover .delete {
        cursor: pointer;
        background-color: #eee;
    }

    .header {
        background-color: #6244DB;
        display: flex;
        color: #FFF;
        width: 100%;
        justify-content: center;
        align-items: center;
        height: 35px;
        font-size: 15px;
        gap: 5px;
    }

    .info {
        display: flex;
        flex-direction: column;
    }

    .info h3 {
        font-size: 15px;
        padding: 4px 8px 0 10px;
        color: #231D2B;
    }

    .info p {
        font-size: 13px;
        padding: 8px 10px 12px;
        margin: 0;
        color: #676071;
    }

    hr {
        background-color: #DDD;
        border: none;
        margin: 0;
        height: 1px;
        margin: 5px 0 3px;
    }

    .company-location {
        display: flex;
        align-items: center;
        font-size: 13px;
        color: #676071;
        padding: 0 10px;
        flex: 1;
    }

    .dot {
        background-color: #DDD;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        margin: 0 20px;
    }
</style>