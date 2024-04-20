export const useUserStore = defineStore('userStore', {
    state: () => ({
        logged: false,
        first_name: '',
        last_name: '',
        description: '',
        phone_number: '',
        email: '',
        position: '',
        gender: '',
        age: 0,
        country: '',
        message: ''
    }),
});