<template>
    <nav class="pagination pagination_type1">
        <ol class="pagination__list  mx-auto mb-3" v-if="childListOfNumber!=0" :key="displayKey">
            <li v-if="pagValue!=1" class="pagination__group"><a href="#" class="pagination__item pagination__control pagination__control_prev" v-on:click="decreaseValue()" >prev</a></li>
            <li class="pagination__group" v-for="value in childListOfNumber"><a href="#" v-bind:class ="checkCurrent(value)"  v-on:click="setValue(value)">{{value}}</a></li>
            <li v-if="pagValue!=childListOfNumber"class="pagination__group"><a href="#" class="pagination__item pagination__control pagination__control_next" v-on:click="increaseValue()">next</a></li>
        </ol>
    </nav>
</template>

<script>
    export default {
        name: "PaginationComponent",
        props:{
            paginationValue: Number,
            listNumber: Number
        },
        data (){
            return{
                pagValue : 0,
                nullableValue : 0 ,
                childListOfNumber: 0,
                displayKey : 0
            }
        },
        methods: {
            increaseValue() {
                this.pagValue += 1 ;
                this.$emit('interface', this.pagValue);
                this.displayKey++;
            },
            decreaseValue(){
                this.pagValue -= 1 ;
                this.$emit('interface', this.pagValue);
                this.displayKey++;
            },
            checkCurrent(page){
                if (this.pagValue ==page) return 'pagination__item pagination__item_active'
                else return 'pagination__item';
            },
            setValue(value){
                this.pagValue = value;
                this.$emit('interface', this.pagValue);
                this.displayKey++;
            }

        },
        beforeMount () {
            this.pagValue = this.paginationValue ;// save props data to itself's data and deal with it
            this.childListOfNumber = this.listNumber;
            this.displayKey+=1;
        }


    }
</script>

<style scoped>
    .pagination__list{
        padding-left: 0;
        margin-top: 0;
        margin-bottom: 0;
        list-style: none;
    }

    .pagination{
        --uiPaginationAlign: var(--paginationAlign);
        --uiPaginationArrowSize: var(--paginationArrowSize, 22px);
        --uiPaginationFontSize: var(--paginationFontSize);

        font-size: var(--uiPaginationFontSize);
    }

    .pagination__list{
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: var(--uiPaginationAlign);
    }

    .pagination__item:not(.pagination__control_prev):not(.pagination__item_active){
        padding-left: .5em;
    }

    .pagination__item:not(.pagination__control_next):not(.pagination__item_active){
        padding-right: .5em;
    }

    .pagination__item{
        display: inline-block;
        line-height: 1;
    }

    .pagination__control{
        position: relative;
    }

    .pagination__control:before, .pagination__control:after{
        font-size: var(--uiPaginationArrowSize);
        line-height: 1;

        position: absolute;
        top: 50%;
        transform: translateY(-50%);
    }

    .pagination__control_prev{
        padding-left: calc(var(--uiPaginationArrowSize) + 5px);
    }

    .pagination__control_prev:before{
        content: "←";
        left: 0;
    }

    .pagination__control_next{
        padding-right: calc(var(--uiPaginationArrowSize) + 5px);
    }

    .pagination__control_next:after{
        content: "→";
        right: 0;
    }

    .pagination__item_active{
        padding: .5875em .8em;
        margin-right: .5em;
        margin-left: .5em;
    }

    /*
    =====
    LEVEL 2. PRESENTATION STYLES
    =====
    */

    .pagination{
        --uiPaginationItemTextColor: var(--paginationItemTextColor);
        --uiPaginationItemActiveTextColor: var(--paginationItemActiveTextColor);
    }

    .pagination__item{
        text-decoration: none;
        color: var(--uiPaginationItemTextColor);
    }

    .pagination__item_active{
        font-weight: 700;
        color: var(--uiPaginationItemActiveTextColor);
    }

    .pagination__item:focus{
        outline-color: var(--uiPaginationItemActiveBgColor);
    }

    /* type 1 */

    .pagination_type1{
        --uiPaginationItemActiveBgColor: var(--paginationItemActiveBgColor);
    }

    .pagination_type1 .pagination__item_active{
        background-color: var(--uiPaginationItemActiveBgColor);
    }





</style>