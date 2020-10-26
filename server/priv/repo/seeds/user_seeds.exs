alias Theme01.Repo
alias Theme01.Management.User

Repo.insert! %User{
    username: "Alex",
    email: "alex@epitech.eu"
}

Repo.insert! %User{
    username: "Marcel",
    email: "marcel@epitech.eu"
}

Repo.insert! %User{
    username: "Nico",
    email: "nico@epitech.eu"
}

Repo.insert! %User{
    username: "Kenny",
    email: "kenny@epitech.eu"
}
