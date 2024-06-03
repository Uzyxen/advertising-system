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
    }
</style>