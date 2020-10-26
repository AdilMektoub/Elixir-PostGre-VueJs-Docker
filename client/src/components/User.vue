/* eslint-disable */
<template>
  <div class="user">
    <label for="user_id">Identifiant de l'utilisateur :</label>
    <input id="user_id" v-model="user_id" class="form-control" type="number" />
    <button v-on:click="getUser(user_id)">Charger ses donn&eacute;es</button>
    <div class="container-fluid" id="main">
      <div class="row row-offcanvas row-offcanvas-left">
        <div class="col main pt-5 mt-3">
          <h1 class="display-4 d-none d-sm-block">
              Dashboard
          </h1>
          <div class="alert alert-warning fade collapse" role="alert" id="myAlert">
              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                  <span aria-hidden="true">�</span>
                  <span class="sr-only">Close</span>
              </button>
              <strong>Holy guacamole!</strong> It's free.. this is an example theme.
          </div>
          <div class="row mb-3">
            <div class="col-xl-3 col-sm-6 py-2">
              <div class="card text-white h-100">
                <div class="card-body">
                  <bar-chart
                    id="bar"
                    data='[
                      { "year": "2013", "and": 10, "ios":5, "win": 2 },
                      { "year": "2014", "and": 10, "ios":15, "win": 3 },
                      { "year": "2015", "and": 20, "ios":25, "win": 2 },
                      { "year": "2016", "and": 30, "ios":20, "win": 1 }
                    ]'
                    xkey="year"
                    ykeys='[ "and", "ios", "win" ]'
                    bar-colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]'
                    grid="true"
                    grid-text-weight="bold"
                    resize="true">
                  </bar-chart>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 py-2">
              <div class="card text-white h-100">
                <div class="card-body">
                  <line-chart
                    id="line"
                    :data="lineData"
                    xkey="year"
                    ykeys='[ "a", "b" ]'
                    labels='[ "Serie A", "Serie B" ]'
                    line-colors='[ "#FF6384", "#36A2EB" ]'
                    grid="true"
                    grid-text-weight="bold"
                    resize="true">
                  </line-chart>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 py-2">
              <div class="card text-white h-100">
                <div class="card-body">
                  <donut-chart
                    id="donut"
                    :data="donutData"
                    colors='[ "#FF6384", "#36A2EB", "#FFCE56" ]'
                    resize="true">
                  </donut-chart>
                </div>
              </div>
            </div>
            <div class="col-xl-3 col-sm-6 py-2">
              <div class="card text-white h-100">
                <div class="card-body">
                  <area-chart
                    id="area_2"
                    data='[
                      { "key": "2013", "value": 30 },
                      { "key": "2014", "value": 25 },
                      { "key": "2015", "value": 29 },
                      { "key": "2016", "value": 50 }
                    ]'
                    resize="true"
                    line-colors='[ "#FF6384", "#36A2EB" ]'
                    grid="true"
                    grid-text-weight="bold">
                  </area-chart>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
    import axios from 'axios'
    import Raphael from 'raphael/raphael'
    import { DonutChart, BarChart, LineChart, AreaChart } from 'vue-morris'
    global.Raphael = Raphael

    /* CONSTANTES */
    const API_ROOT = "http://localhost:4000/";

    console.log({
        users: [
            { id: 1, username: 'Paris', email: '20.6' }
        ]
    });
    export default {
        name: 'User',
        components: {
            DonutChart, BarChart, LineChart, AreaChart
        },
        data() {
            return {
                users: [
                    { id: 1, username: 'Paris', email: '20.6' }
                ],
                user_id: 0,
                donutData: [
                    { label: 'Identifiant', value: 300 },
                    { label: 'Blue', value: 50 },
                    { label: 'Yellow', value: 100 }
                ],
                lineData: []
            }
        },
        props: {
            username: String,
            email: String
        },
        methods: {
            selectedUser: function (username) {
                if (this.username) {
                    return username === this.username;
                }
                return false;
            },
            rand (limit) {
                return Math.round(Math.random() * limit)
            },
            /*change(e) {
                  const selectedUser = e.target.value;
                  const user = this.users.find(user => selectedUser === user.username);
                  if (user) {
                    this.user = user;
                    this.$router.push({ path: `/currentWeather/${this.weather.town}` });
                  }
            },*/


            /*********** API CALLS ***********/
            createUser: function (username, email) {
                axios
                    .post(
                      API_ROOT + "api/users",
                      {email: email, username: username}
                  )
                  .then(response => {
                    console.log(response)
                  })
                  .catch(error => {
                    console.log(error);
                  });
            },
            updateUser: function (id, username = "", email = "") {
                axios
                  .put(
                      API_ROOT + "api/users/" + id,
                      {"email": email, "username": username}
                  )
                  .then(response => {
                    console.log(response)
                  })
                  .catch(error => {
                    console.log(error);
                  });

                   //console.log(id + username + email);

            },
            getUser: async function (id) {
                const response = await axios({
                    url: API_ROOT + "api/users/" + id,
                    method: "GET"
                });

                console.log(response.data);
            },
            deleteUser: function (id) {
                axios
                    .delete(
                        API_ROOT + "api/users/" + id, {}
                  )
                  .then(response => {
                    console.log(response)
                  })
                  .catch(error => {
                    console.log(error);
                  });
            }
        },
        mounted () {
            setInterval(() => {
                this.lineData = [
                    { year: '2013', a: this.rand(100), b: this.rand(100) },
                    { year: '2014', a: this.rand(100), b: this.rand(100) },
                    { year: '2015', a: this.rand(100), b: this.rand(100) },
                    { year: '2016', a: this.rand(100), b: this.rand(100) }
                ]
            }, 5000)
        }
    }
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}
.card {
    border-radius: 20px;
}
</style>
