<template>
    <div class="flex-container">
        <span>
            <input @blur="checkEmail" :class="{ error: error }" type="text" placeholder="Adres e-mail" v-model="model">
        </span>
        <p class="error">{{ errorMessage }}</p>
    </div>
</template>

<script setup>
    //data
    const error = ref(false);
    const errorMessage = ref('');

    // model
    const model = defineModel();

    // methods 
    function checkEmail() {
        if(model.value.length <= 0) {
            error.value = true;
            errorMessage.value = 'Uzupełnij pole!'; 
        } else {
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if(!regex.test(model.value)) {
                error.value = true;
                errorMessage.value = 'Niepoprawny email!'; 
            } else {
                error.value = false;
                errorMessage.value = '';
            }
        }
    }
</script>

<style scoped>
    .flex-container {
        display: flex;
        flex-direction: column;
        gap: 50px;
    }

    span {
        position: relative;
        user-select: none;
    }

    p.error {
        margin: 0;
        padding: 0;
        font-size: 14px;
        color: #ff3333;
    }

    input {
        border: 1px solid var(--asc-bg-border);
        padding: 15px;
        width: calc(100% - 55px);
        padding-right: 40px;
    }

    input.error {
        border-color: #ff3333;
    }
</style>