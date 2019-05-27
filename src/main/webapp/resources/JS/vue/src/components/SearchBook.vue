<template>
    <div>
        <div class="search resultSearch">
            <div class="search-container mb-2">
                <input type="text" class="form-control " name="searchMessage" v-model="searchMessage"
                       v-text="searchMessage">
                <!--<input hidden name="tag" value="" id="tag_input">-->
                <button type="submit" class="button search-icon" v-on:click="searchByTags()">
                    <img src="resources\pic\search.png" alt="">
                </button>
            </div>
        </div>
        <div class="search_tag_list" v-if="tagsSearchMassiveId!=''">
            <div class=" border border-secondary rounded d-inline-block p-1 pl-2 pr-2 mr-2 select_tag"
                 v-for="tag in tagsSearchMassive" :id="tag.id">
                <a href="#" class="mr-1 text-dark mb-2 close-tag " v-on:click="closeTag(tag)"><i
                        class="fas fa-times"></i></a>{{tag.name}}
            </div>

        </div>
        <div class="row search_container ">
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
                            Not available
                        </div>
                        <div v-else class="available">
                            Available
                        </div>
                    </div>
                </div>
            </div>
            <div v-else class="noBook col-9"></div>
            <div class="col-3 pl-4 pr-4 pt-2 tags_left_side_menu">
                <h3>Tags:</h3>
                <div class="search-tags" :key="displaykey" v-if="tags != null">
                    <div class="single-search-tag" :id="tag.id" v-for="tag in tags">
                        <a href="#" v-on:click="addSearchTags(tag)" class="p-1 tag_icon" v-if="checkSelectTag(tag)"><i class="fas fa-plus"></i></a><a
                           v-else href="#" v-on:click="closeTag(tag)" class="p-1 tag_icon"><i class="fas fa-minus"></i></a>{{tag.name}}
                    </div>
                </div>
            </div>
        </div>
        <pagination></pagination>
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
            closeTag(tag) {
                var index = this.tagsSearchMassiveId.indexOf(tag.id);
                if (index != -1) {
                    this.tagsSearchMassiveId.splice(index, 1);
                    this.tagsSearchMassive.splice(index, 1);
                    this.searchByTags();
                }
            },
            addSearchTags(tag) {
                if (this.tagsSearchMassiveId.indexOf(tag.id) == -1) {
                    this.tagsSearchMassiveId.push(tag.id);
                    this.tagsSearchMassive.push(tag);
                    this.searchByTags();
                }

            },
            checkSelectTag(tag){
                return this.tagsSearchMassiveId.indexOf(tag.id) == -1 ? true : false ;
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
