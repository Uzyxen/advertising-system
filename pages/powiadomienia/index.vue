<template>
    <div id="container">
        <SectionTitle>Powiadomienia</SectionTitle>

        <div id="content">
            {{ notifications }}
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
</style>