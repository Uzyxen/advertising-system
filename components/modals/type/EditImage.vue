<template>
    <ModalHeader>Wybierz zdjęcie</ModalHeader>
    <span v-if="fileError">{{ fileError }}</span>

    <label for="file-input" v-if="uploaded === false">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M288 109.3V352c0 17.7-14.3 32-32 32s-32-14.3-32-32V109.3l-73.4 73.4c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0l128 128c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L288 109.3zM64 352H192c0 35.3 28.7 64 64 64s64-28.7 64-64H448c35.3 0 64 28.7 64 64v32c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V416c0-35.3 28.7-64 64-64zM432 456a24 24 0 1 0 0-48 24 24 0 1 0 0 48z"/>
        </svg>
    </label>

    <input type="file" id="file-input" @change="handleFileUpload" ref="fileInput" accept="image/*">

    <div id="selected-file" v-if="uploaded === true && file">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M0 96C0 60.7 28.7 32 64 32H448c35.3 0 64 28.7 64 64V416c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V96zM323.8 202.5c-4.5-6.6-11.9-10.5-19.8-10.5s-15.4 3.9-19.8 10.5l-87 127.6L170.7 297c-4.6-5.7-11.5-9-18.7-9s-14.2 3.3-18.7 9l-64 80c-5.8 7.2-6.9 17.1-2.9 25.4s12.4 13.6 21.6 13.6h96 32H424c8.9 0 17.1-4.9 21.2-12.8s3.6-17.4-1.4-24.7l-120-176zM112 192a48 48 0 1 0 0-96 48 48 0 1 0 0 96z"/>
        </svg>

        <div id="file-info">
            <h2>{{ file.name }}</h2>
            <h3>{{ formatFileSize(file.size) }}</h3>
        </div>

        <svg @click="deleteImage" id="close" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
        </svg>
    </div>

    <ModalSaveButton v-if="uploaded === true" @click="saveImage">Zapisz zdjęcie</ModalSaveButton>
</template>

<script setup>
    // props
    const props = defineProps(['isCompany']);

    // emits 
    const emit = defineEmits(['uploaded']);

    const file = ref();
    const uploaded = ref(false);
    const allowedTypes = ref(['image/jpeg', 'image/png']);
    const fileInput = ref(null);

    const fileError = ref('');

    function handleFileUpload(event) {
        file.value = event.target.files[0];

        if(file) {
            if(!allowedTypes.value.includes(file.value.type)) {
                
                fileError.value = 'Nieprawidłowy typ zdjęcia!';
            } else {
                fileError.value = '';
                uploaded.value = true;
            }
        }
    }

    function formatFileSize(bytes) {
        if (bytes >= 1024 * 1024) {
            return `${(bytes / (1024 * 1024)).toFixed(2)} MB`;
        } else {
            return `${(bytes / 1024).toFixed(2)} KB`;
        }
    }

    async function saveImage() {
        let response;

        if(file.value) {
            const formData = new FormData();
            formData.append('file', file.value);

            if(props.isCompany) {
                response = await $fetch('http://localhost/advertising-system/backend/api/company/UpdateImage.php', { credentials: 'include', responseType: 'json', method: 'post', body: formData });
            } else {
                response = await $fetch('http://localhost/advertising-system/backend/api/user/UpdateImage.php', { credentials: 'include', responseType: 'json', method: 'post', body: formData });
            }   

            if(response) {
                emit('uploaded');
            }
        }
    }

    function deleteImage() {
        file.value = null;
        uploaded.value = false;
        fileInput.value.value = null;
    }
</script>

<style scoped>
    label {
        width: 100%;
        border: 1px solid #DDD;
        height: 200px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    span {
        font-size: 16px;
        color: #FA4132;
        text-align: center;
    }

    input {
        display: none;
    }

    label svg {
        width: 15%;
        fill: #DDD;
        transition: fill.3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    label:hover svg {
        fill: var(--asc-bg);
    }

    #selected-file {
        position: relative;
        background-color: #DDD;
        padding: 20px 10px;
        width: calc(100% - 20px);
        display: flex;
        gap: 20px;
        align-items: center;
    }

    #selected-file svg {
        fill: #aaa;
        width: 30px;
        height: 30px;
    }

    #file-info {
        display: flex;
        flex-direction: column;
        gap: 5px;
        width: 80%;
    }

    #file-info h2 {
        font-size: 18px;
        font-weight: 600;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    #file-info h3 {
        font-size: 12px;
    }

    #close {
        position: absolute;
        right: 10px;
        width: 20px;
        cursor: pointer;
        fill: #231D2B;
        z-index: 99;
        transition: fill .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    #close:hover {
        fill: #F44534;
    }
</style>