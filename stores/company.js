export const useCompanyStore = defineStore('companyStore', {
    state: () => ({
        logged: false,
        name: '',
        email: '',
        company_NIP: '',
        message: ''
    }),
});