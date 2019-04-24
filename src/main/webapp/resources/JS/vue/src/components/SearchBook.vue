<template>
    <div>
        <div class="search resultSearch">
            <form action="search" class="search-container">

                <input type="text" class="form-control" name="search" v-model="search">


                <input hidden name="tag" value="" id="tag_input">
                <button type="submit" class="button search-icon">
                    <img src="resources\pic\search.png" alt="">
                </button>
            </form>

        </div>
        <div :key="displaykey">
            <div class="search_result" v-if="!answer" >

                <div class="result" v-for="book in answer.books " :id="book.id">
                    <div class="media">
                        <a :href="'book/' + book.id">
                            <img height="150px" width="100px" :src="'data:image/jpeg;base64,'+ book.base64">
                        </a>

                        <div class="media-body">
                            <a :href="'book/' + book.id"><h3>{{book.name}}</h3></a>
                            <p>By {{book.author}}</p>
                            <p>{{book.edition}} edition</p>
                        </div>
                        <div v-if="book.amount==0" class="available">
                            <span>X</span>
                            Not available
                        </div>
                        <div v-else class="available">
                            <span>&#10003</span>
                            Available
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "search-component",

        data() {
            return {
                answer: null,
                search: null,
                displaykey: 0

            }
        },
        mounted () {
            this.loadData('/api/getAllBooks');
        },
        methods: {
            loadData(url) {
              return  this.$axios.get(url).then(response => {
                    this.answer = response.data;
                    this.displaykey++;
                    this.loading = false;

                });

            }

        }
    }

</script>

<style scoped>

</style>
