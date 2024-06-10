<template>
    <div id="experience" :class="{ edit: isEditMode }">
        <div id="experience-block" v-for="(experience, index) in userExperience" :key="index">
            <div id="abstract" v-if="!isEditMode">
                <div id="circle"></div>
                <div id="line"></div>
            </div>

            <Experience :is-edit-mode="isEditMode" :experience="experience" @deleted="(id) => userExperience = userExperience.filter(element => element.doswiadczenie_id !== id)" />
        </div>
    </div>
</template>

<script setup>
    const { data: userExperience } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserExperience.php', { credentials: 'include', responseType: 'json', method: 'post' });

    defineProps(['isEditMode']);
</script>

<style scoped>
    #experience {
        display: flex;
        flex-direction: column;
        padding: 22px 22px 13px;
    }

    #experience.edit {
        padding: 0;
        gap: 30px;
    }

    #experience > div#experience-block {
        display: flex;
        gap: 20px;
    }

    #experience > div#experience-block.edit {
        border: 1px solid #eee;
        background-color: #DDD;
    }

    #experience div#experience-block > #abstract {
        width: 25px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    #experience #circle {
        border: 3px solid #6244DB;
        height: 19px;
        width: 19px;
        border-radius: 50%;
    }

    #experience #line {
        height: 250px;
        width: 3px;
        background-color: #6244DB;
    }
</style>