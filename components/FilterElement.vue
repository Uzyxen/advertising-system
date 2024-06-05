<template>
    <div class="filter-element" @click="toggleSelection" :class="{ selected: isSelected }">
        <svg v-if="isSelected" class="selected" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zM337 209L209 337c-9.4 9.4-24.6 9.4-33.9 0l-64-64c-9.4-9.4-9.4-24.6 0-33.9s24.6-9.4 33.9 0l47 47L303 175c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9z"/>
        </svg>

        <svg v-else xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M384 80c8.8 0 16 7.2 16 16V416c0 8.8-7.2 16-16 16H64c-8.8 0-16-7.2-16-16V96c0-8.8 7.2-16 16-16H384zM64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64z"/>
        </svg>
        <slot />
    </div>
</template>

<script setup>
    const isSelected = ref(false);
    const emit = defineEmits(['select', 'unselect']);

    function toggleSelection() {
        if(isSelected.value === false) {
            isSelected.value = true;
            emit('select');
        } else {
            isSelected.value = false;
            emit('unselect');
        }
    }
</script>

<style scoped>
    .filter-element {
        display: flex;
        align-items: center;
        gap: 10px;
        user-select: none;
        font-size: 15px;
        color: var(--asc-txt-ui-sec);
        padding: 7px 20px;
        cursor: pointer;
    }

    .filter-element.selected {
        background-color: var(--asc-txt-ui-sec-alt);
    }

    .filter-element:hover {
        background-color: #eee;
    }

    svg {
        width: 15px;
        fill: var(--asc-txt-ui-sec);
    }

    svg.selected {
        fill: var(--asc-bg);
    }

</style>