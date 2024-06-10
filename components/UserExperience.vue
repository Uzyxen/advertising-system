<template>
    <div id="experience">
        <div id="experience-block" v-for="(experience, index) in userExperience" :key="index">
            <div id="abstract">
                <div id="circle"></div>
                <div id="line"></div>
            </div>

            <Experience :experience="experience" />
        </div>
    </div>
</template>

<script setup>
    const { data: userExperience } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserExperience.php', { credentials: 'include', responseType: 'json', method: 'post' });
</script>

<style scoped>
    #experience {
        display: flex;
        flex-direction: column;
        padding: 22px 22px 13px;
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