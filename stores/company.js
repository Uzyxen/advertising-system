export const useUserStore = defineStore('userStore', {
    state: () => ({
        logged: false,
        name: '',
        email: '',
        company_NIP: '',
        message: ''
    }),
});