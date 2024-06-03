<template>
    <ModalHeader>Zarządzaj aplikacją</ModalHeader>

    <h2>{{ user.imie }} {{ user.nazwisko }}</h2>
    <h3>{{ user.stanowisko }}</h3>

    <div style="display: flex; gap: 10px;">
        <ColorButton @button-clicked="rejectApplication" :background-color="'#ff3333'">Odrzuć</ColorButton>
        <PurpleButton @button-clicked="confirmApplication">Zatwierdź</PurpleButton>
    </div>
</template>

<script setup>
    const props = defineProps(['user']);

    // data
    const data = ref({
        userId: props.user.uzytkownik_id,
        applicationId: props.user.application_id
    });

    // functions
    async function rejectApplication() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/application/RejectUserApplication.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'data': data.value } });
    }

    async function confirmApplication() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/application/ConfirmUserApplication.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'data': data.value } });
        
        if(response) {
            await $fetch('http://localhost/advertising-system/backend/api/notification/SetUserNotification.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'user_id': data.value.userId } });

        }
    }
</script>

<style scoped>

</style>