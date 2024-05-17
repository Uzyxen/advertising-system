<template>
    <div id="filters">
        <section v-for="filter in filters" :key="filter.id">
            <h3 @click="toggleDropdown(filter.id)">
                {{ filter.title }}

                <svg :class="{ opened: filter.isDropdownVisible }" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M233.4 105.4c12.5-12.5 32.8-12.5 45.3 0l192 192c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L256 173.3 86.6 342.6c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l192-192z"/>
                </svg>
            </h3>

            <FilterDropdown v-if="filter.isDropdownVisible">
                <FilterElement v-for="jobLevel in jobLevels" v-if="filter.id === 0">
                    {{ jobLevel.name }}
                </FilterElement>

                <FilterElement v-for="contractType in contractTypes" v-if="filter.id === 1">
                    {{ contractType.name }}
                </FilterElement>
            </FilterDropdown>
        </section>
    </div>
</template>

<script setup>
    const { data: jobLevels } = await useFetch('http://localhost/advertising-system/backend/api/job/GetJobLevels.php', { responseType: 'json', method: 'post' });
    const { data: contractTypes } = await useFetch('http://localhost/advertising-system/backend/api/job/GetContractTypes.php', { responseType: 'json', method: 'post' });

    const filters = ref([
        { id: 0, title: 'Poziom stanowiska', isDropdownVisible: true },
        { id: 1, title: 'Rodzaj umowy', isDropdownVisible: false },
        { id: 2, title: 'Tryb pracy', isDropdownVisible: false },
        { id: 3, title: 'Wymiar pracy', isDropdownVisible: false }
    ]);

    // functions

    function toggleDropdown(id) {
        filters.value[id].isDropdownVisible = !filters.value[id].isDropdownVisible;
    }
</script>

<style scoped>
    #filters {
        height: 900px;
        width: 30%;
        background-color: var(--asc-bg-alt);
    }

    section h3 {
        display: flex;
        align-items: center;
        cursor: pointer;
        justify-content: space-between;
        padding: 20px 25px;
        margin-bottom: 10px;
        color: var(--asc-txt-sec);
        border-bottom: 1px solid var(--asc-bg-border);
    }

    section h3 svg {
        width: 15px;
        fill: var(--asc-bg);
        transform: rotate(180deg);
    }

    svg.opened {
        transform: rotate(360deg);
    }
</style>