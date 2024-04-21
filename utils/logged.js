export function IsUserLogged() {
    const userStore = useUserStore();

    return userStore.logged;
}

export function IsCompanyLogged() {
    const companyStore = useCompanyStore();

    return companyStore.logged;
}