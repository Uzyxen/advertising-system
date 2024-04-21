<template>
    <BackButton />
    <slot />
</template>

<script setup>
    const userStore = useUserStore();
    const companyStore = useCompanyStore();

    userStore.GetUserData();
</script>