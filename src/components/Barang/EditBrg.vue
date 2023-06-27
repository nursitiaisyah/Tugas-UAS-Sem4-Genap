<template>
    <div>
        <navbar-component></navbar-component>
        <sidebar-component></sidebar-component>
        <div class="content-wrapper">
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Form Edit Barang</h1>
                        </div>          
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card card-success">
                                <div class="card-header">
                                    <h3 class="card-title">Edit Barang</h3>
                                </div>
                                <form @submit.prevent="edit">
                                    <input type="hidden" v-model="id">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Kode Barang </label>
                                            <input type="text" class="form-control" v-model="kode_barang">
                                        </div> 

                                        <div class="form-group">
                                            <label>Nama Barang </label>
                                            <input type="text" class="form-control" v-model="nama_barang">
                                        </div>

                                        <div class="form-group">
                                            <label>Merk </label>
                                            <input type="text" class="form-control" v-model="merk">
                                        </div>

                                        <div class="form-group">
                                            <label>Harga</label>
                                            <input type="number"  class="form-control" v-model="harga">
                                        </div>

                                        <div class="form-group">
                                            <label>Stok</label>
                                            <input type="number"  class="form-control" v-model="stok">
                                        </div>
                                        
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-primary" >Simpan</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
import Vue from 'vue';

Vue.use(axios);

export default {
    data() {
        return {
            data_barang : [],
            id : "",
            kode_barang:'',
            nama_barang:'',
            merk:'',
            harga:"",
            stok:"",
        }
    },
    created() {  
        this.DataMenu(),
        this.getdetail(this.$route.params.id)
        this.editdata()
    },
    methods : {
        DataMenu(){
            axios.get('http://127.0.0.1:8000/api/getbarang')
            .then(
                ({data}) => {
                    this.data_barang = data;
                }
            );
        },
        getdetail(id){
            axios.get('http://127.0.0.1:8000/api/getid/' + id)
            .then((response) => {
                console.log(response.data[0])
                this.id = response.data[0].id

                this.kode_barang = response.data[0].kode_barang
                this.nama_barang = response.data[0].nama_barang
                this.merk = response.data[0].merk
                this.harga = response.data[0].harga
                this.stok = response.data[0].stok
            })
        },
        edit : function (){
            let DataMenu= {
                id : this.id,
                
                kode_barang : this.kode_barang,
                nama_barang : this.nama_barang,
                merk : this.merk,
                harga: this.harga,
                stok: this.stok
            }
            axios.put("http://127.0.0.1:8000/api/updatebarang/" + this.id , DataMenu)
            .then(
                ({data}) => {
                    alert("Berhasil update Barang");
                    this.$router.push('/data_barang');
                    this.data_barang = data;
                }
            )
        },
    }
}

</script>
