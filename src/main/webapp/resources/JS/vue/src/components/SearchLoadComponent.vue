<template>
    <div>
    <div class="search resultSearch">
        <form action="search" class="search-container">
            <input type="text" class="form-control" name="searchMessage" v-model="search" v-text="search">
            <!--<input hidden name="tag" value="" id="tag_input">-->
            <button type="submit" class="button search-icon">
                <img src="resources\pic\search.png" alt="">
            </button>
        </form>
    </div>
    <search-component
            :key="displaykey"
            :load-data = "answer"
            :search = "search"
    >

    </search-component>
    </div>
</template>

<script>
    export default {
        name: "SearchLoadComponent",

        data() {
            return {
                displaykey: 0,
                answer: null,
                search : "",
                tag: null
            }
        },
        created() {
            this.loadData('/api/getAllBooks');
            // this.getSearchMessage();
        },

        methods: {
            loadData(url) {
                return this.$axios.get(url).then(response => {
                    this.answer = response.data;
                    this.displaykey++;
                });

            },
            // getSearchMessage(){
            //     var url = new URL(window.location.href);
            //     this.search = url.searchParams.get("seachMessage");
            //     this.tag = url.searchParams.get("tag");
            //
            // },

        }
    }
</script>

<style scoped>

</style>