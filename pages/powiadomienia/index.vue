<template>
    <div id="container">
        <SectionTitle>Powiadomienia</SectionTitle>

        <div id="content">
            <Notification v-for="notification in notifications" :notification="notification" />
        </div>
    </div>
</template>

<script setup>
    const { data: notifications } = await useFetch('http://localhost/advertising-system/backend/api/notification/GetNotifications.php', { credentials: 'include', responseType: 'json', method: 'post' });
</script>

<style scoped>
    #container {
        padding: 20px 150px;
    }

    #content {
        display: flex;
        flex-direction: column;
        gap: 5px;
        min-height: 100vh;
        background-color: var(--asc-bg-alt);
        -webkit-box-shadow: 0px 0px 12px 0px rgb(4 4 4 / 15%);
        -moz-box-shadow: 0px 0px 12px 0px rgb(4 4 4 / 15%);
        box-shadow: 0px 0px 12px 0px rgb(4 4 4 / 15%);
        padding: 10px;
    }
</style>