<template>
    <div id="filters">
        <section v-for="filter in filters" :key="filter.id">
            <h3 @click="toggleDropdown(filter.id)">
                <div>
                    {{ filter.title }} <p v-if="filter.numberOfSelected != 0">{{ filter.numberOfSelected }}</p>
                </div>

                <svg :class="{ opened: filter.isDropdownVisible }" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M233.4 105.4c12.5-12.5 32.8-12.5 45.3 0l192 192c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L256 173.3 86.6 342.6c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l192-192z"/>
                </svg>
            </h3>

            <KeepAlive>
                <FilterDropdown v-if="filter.isDropdownVisible">
                    <FilterElement v-for="filter_element in filter.filter_elements" @select="filter.numberOfSelected++" @unselect="filter.numberOfSelected--">
                        {{ filter_element.name }}
                    </FilterElement>
                </FilterDropdown>
            </KeepAlive>
        </section>
    </div>
</template>

<script setup>
    const { data: jobLevels } = await useFetch('http://localhost/advertising-system/backend/api/job/GetJobLevels.php', { responseType: 'json', method: 'post' });
    const { data: contractTypes } = await useFetch('http://localhost/advertising-system/backend/api/job/GetContractTypes.php', { responseType: 'json', method: 'post' });
    const { data: jobModes } = await useFetch('http://localhost/advertising-system/backend/api/job/GetJobModes.php', { responseType: 'json', method: 'post' });
    const { data: employmentTypes } = await useFetch('http://localhost/advertising-system/backend/api/job/GetEmploymentTypes.php', { responseType: 'json', method: 'post' });

    const filters = ref([
        { id: 0, title: 'Poziom stanowiska', filter_elements: jobLevels.value, numberOfSelected: 0, isDropdownVisible: true },
        { id: 1, title: 'Rodzaj umowy', filter_elements: contractTypes.value, numberOfSelected: 0, isDropdownVisible: false },
        { id: 2, title: 'Tryb pracy', filter_elements: jobModes.value, numberOfSelected: 0, isDropdownVisible: false },
        { id: 3, title: 'Wymiar pracy', filter_elements: employmentTypes.value, numberOfSelected: 0, isDropdownVisible: false }
    ]);

    // functions

    function toggleDropdown(id) {
        filters.value[id].isDropdownVisible = !filters.value[id].isDropdownVisible;
    } 
</script>

<style scoped>
    #filters {
        height: 900px;
        width: 350px;
        background-color: var(--asc-bg-alt);
        -webkit-box-shadow: 0px 0px 12px 0px rgb(4 4 4 / 15%);
        -moz-box-shadow: 0px 0px 12px 0px rgb(4 4 4 / 15%);
        box-shadow: 0px 0px 12px 0px rgb(4 4 4 / 15%);
    }

    section {
        width: 100%;
    }

    section h3:hover {
        background-color: #eee;
    }

    section h3 {
        display: flex;
        align-items: center;
        cursor: pointer;
        justify-content: space-between;
        padding: 20px 25px;
        margin-bottom: 10px;
        color: var(--asc-txt-sec);
        font-size: 18px;
        border-bottom: 1px solid var(--asc-bg-border);
        margin: 0;
    }

    section h3 > div {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    section h3 div p {
        margin: 0;
        background-color: var(--asc-txt-ui-sec);
        color: var(--asc-txt-alt);
        width: 20px;
        height: 20px;
        font-size: 12px;
        display: flex;
        font-weight: 500;
        justify-content: center;
        align-items: center;
        border-radius: 2px;
    }

    section h3 svg {
        width: 15px;
        fill: var(--asc-bg);
        transform: rotate(180deg);
    }

    svg.opened {
        transform: rotate(360deg);
    }

    @media (max-width: 1015px) {
        #filters {
            width: 300px;
        }
    }
    
    @media (max-width: 896px) {
        #filters {
            height: auto;
            width: 100%;
        }

        #filters section:last-child h3 {
            border-bottom: none;
        } 
    }
</style>