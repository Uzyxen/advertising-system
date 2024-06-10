<template>
    <div class="education">
        <div class="dates">
            {{ education.start_date }} - {{ education.end_date }}
        </div>

        <div class="content">
            <h2>Wykształcenie {{ education.level }} - {{ education.specialization }}</h2>

            <h3>{{ education.name }}, {{ education.location }}</h3>
        </div>
    </div>
</template>

<script setup>
    defineProps(['education']);
</script>

<style scoped>
    .education {
        border: 1px solid #DDD;
    }

    .dates {
        background-color: var(--asc-bg);
        color: var(--asc-txt-alt);
        font-size: 15px;
        padding: 15px;
    }

    .content {
        padding: 10px;
        display: flex;
        flex-direction: column;
        gap: 10px;
        color: var(--asc-txt-sec);
    }

    h3 {
        font-weight: 600;
    }
</style>