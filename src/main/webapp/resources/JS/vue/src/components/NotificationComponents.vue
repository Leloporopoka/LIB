<template>
    <div>
        <div class="toast__container"  v-if="notification !=undefined">
            <div class="toast__cell"  v-for="not in notification " :id="not.id">
                <div class="toast" v-bind:class="not.availabilty ?    'toastGreen' :'toastYellow' " >
                    <div class="toast__content" v-if="not.availabilty">
                        <p class="toast__type" >{{not.book.name}}</p>
                        <p class="toast__message">Book "{{not.book.name}}" became available for reservation. You can reserve it or take it from our library.</p>
                    </div>
                    <div class="toast__content" v-if="!not.availabilty">
                        <p class="toast__type" >{{not.book.name}}</p>
                        <p class="toast__message">Book "{{not.book.name}}" still not available for reservation. This may change when there are instances of this book in the library.</p>
                    </div>
                </div>


            </div>
        </div>
    </div>
</template>

<script>

    export default {
        name: "NotificationComponents",
        data() {
            return {
                displaykey: 0,
                notification: null,
            }
        },
        mounted() {
            this.loadData('/profile/getAllNotifications');
        },
        methods: {
            loadData(url) {
                return this.$axios.get(url).then(response => {

                    this.notification = response.data;
                    this.displaykey++;
                }).catch(error => {
                    console.log(error.message);
                });

            },
            closeNotification(e){
                e.preventDefault();
                var parent = $(this).parent('.toast');
                parent.fadeOut("slow", function() { $(this).remove(); } );
            }

        }
    }
</script>

<style scoped>
    @import url('https://fonts.googleapis.com/css?family=Raleway:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i');

    html, body {
        height: 100%;
        width: 100%;
        font-family: 'Raleway', sans-serif;
        background-color: #efefef;
        display: table;
        text-align: center;

    }

    .toast__container {
        display: table-cell;
        vertical-align: middle;
    }

    .toast__cell {
        display: inline-block;
    }

    .add-margin {
        margin-top: 20px;
    }

    .toast__svg {
        fill: #fff;
    }

    .toast {
        text-align: left;
        padding: 21px 0;
        background-color: #fff;
        border-radius: 4px;
        margin-bottom: 20px;
        top: 0px;
        position: relative;
        box-shadow: 1px 7px 14px -5px rgba(0, 0, 0, 0.2);
    }

    .toast:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 4px;
        height: 100%;
        border-top-left-radius: 4px;
        border-bottom-left-radius: 4px;

    }

    .toast__icon {
        position: absolute;
        top: 50%;
        left: 22px;
        transform: translateY(-50%);
        width: 14px;
        height: 14px;
        padding: 7px;
        border-radius: 50%;
        display: inline-block;
    }

    .toast__type {
        color: #3e3e3e;
        font-weight: 700;
        margin-top: 0;
        margin-bottom: 8px;
    }

    .toast__message {
        font-size: 14px;
        margin-top: 0;
        margin-bottom: 0;
        color: #878787;
    }

    .toast__content {
        padding-left: 40px;
        padding-right: 60px;
    }

    .toast__close {
        position: absolute;
        right: 22px;
        top: 50%;
        width: 14px;
        cursor: pointer;
        height: 14px;
        fill: #878787;
        transform: translateY(-50%);
    }

    .toastGreen .toast__icon {
        background-color: #2BDE3F;
    }

    .toastGreen:before {
        background-color: #2BDE3F;
    }

    .toast--blue .toast__icon {
        background-color: #1D72F3;
    }

    .toast--blue:before {
        background-color: #1D72F3;
    }

    .toastYellow .toast__icon {
        background-color: #FFC007;
    }

    .toastYellow:before {
        background-color: #FFC007;
    }
</style>