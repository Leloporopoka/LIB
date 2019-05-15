<template>

    <search-component
            :key="displaykey"
            :load-data = "answer"
            :search = "search"
    >

    </search-component>

</template>

<script>
    export default {
        name: "SearchLoadComponent",

        data() {
            return {
                displaykey: 0,
                answer: null,
                search : this.searchMessage,
                tag: null
            }
        },
        props:{
            searchMessage: String
        },
        created() {
            this.loadData('/api/getAllBooks');
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