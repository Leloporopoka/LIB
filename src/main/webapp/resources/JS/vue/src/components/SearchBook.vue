<template>

    <div class="search_result" v-if="answer !=undefined">

        <div class="result" v-for="book in filteredList " :id="book.id">
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
                    <!--<span>X</span>-->
                    Not available
                </div>
                <div v-else class="available">
                    <!--<span>&#10003</span>-->
                    Available
                </div>
            </div>
        </div>
    </div>
    <div v-else  class="noBook"></div>


</template>

<script>
    export default {
        name: "search-component",
        props: {
            loadData: Array,
            search: String,
        },

        data() {
            return {
                answer: this.loadData,
            }
        },

        computed: {
            filteredList() {
                if(this.search == undefined)
                    this.search = "";
                return this.answer.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })

                    // .push(this.answer.filter(post => {
                    //     return post.author.toLowerCase().includes(this.search.toLowerCase())
                    // }))
            }


        }
    }

</script>

<style scoped>

</style>
