<template>
    <div class="row">
        <div class="search_result col-9" v-if="answer !=undefined">

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
        <div v-else class="noBook col-9"></div>
        <div class="col-3">
            <div class="search-tags" :key="displaykey" v-if="tags != null">
                <div class="single-search-tag" :id="tag.id" v-for="tag in tags">
                    <i>+</i><i>-</i>{{tag.name}}
                </div>
            </div>
        </div>
    </div>

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
                tagsUrl: '/api/getAllTags',
                answer: this.loadData,
                tags: null,
                displayKey: 0
            }
        },
        created() {
            this.loadTags(this.tagsUrl);
        },

        methods: {
            loadTags(url) {
                return this.$axios.get(url).then(response => {
                    this.tags = response.data;
                    this.displaykey++;
                });

            },
        },

        computed: {
            filteredList() {
                if (this.search == undefined)
                    this.search = "";
                return this.answer.filter(post => {
                    return post.name.toLowerCase().includes(this.search.toLowerCase())
                })
            }


        }
    }

</script>

<style scoped>

</style>
