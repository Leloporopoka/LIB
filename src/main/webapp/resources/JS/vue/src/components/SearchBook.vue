<template>
    <div>
        <div class="search resultSearch">
            <div class="search-container">
                <input type="text" class="form-control " name="searchMessage" v-model="searchMessage"
                       v-text="searchMessage">
                <!--<input hidden name="tag" value="" id="tag_input">-->
                <button type="submit" class="button search-icon" v-on:click="searchByTags()">
                    <img src="resources\pic\search.png" alt="">
                </button>
            </div>
        </div>
        <div class="search_tag_list" v-if="tagsSearchMassiveId!=''">
            <div class="rounded d-inline" v-for="tag in tagsSearchMassive" :id="tag.id"><i>x</i>{{tag.name}}</div>
        </div>
        <div class="row search_container">
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
                        <i v-on:click="addSearchTags(tag)">+</i><i>-</i>{{tag.name}}
                    </div>
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
                displayKey: 0,
                searchByTagsUrl: '/api/getBookByTags',
                searchMessage: this.search,
                tagsSearchList: '',
                tagsSearchMassiveId: [],
                tagsSearchMassive: [],
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
            searchByTags() {

                this.$axios.get(this.searchByTagsUrl + '?tags=' + this.tagsSearchMassiveId + '&search=' + this.searchMessage)
                    .then(response => {
                        this.answer = response.data
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            },
            addSearchTags(tag) {
                if (this.tagsSearchMassiveId.indexOf(tag.id)) {
                    this.tagsSearchMassiveId.push(tag.id);
                    this.tagsSearchMassive.push(tag);
                    this.searchByTags();
                }

            }
        },

        computed: {
            filteredList() {
                if (this.searchMessage == undefined)
                    this.searchMessage = "";
                return this.answer.filter(post => {
                    return post.name.toLowerCase().includes(this.searchMessage.toLowerCase())
                })
            }


        }
    }

</script>

<style scoped>

</style>
