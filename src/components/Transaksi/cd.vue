<template>
    <div>
        <div class="content-wrapper">            
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-0">Data Penjualan</h1>
                        </div>          
                    </div>
                </div>
            </div>
 
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="card card-primary card-outline">
                                <div class="card-body">
                                    <button type="button" data-bs-toggle="modal" data-bs-target="#tambahModal" class="btn btn-info mb-2">
                                        <i class="fas fa-plus"></i> Tambah
                                    </button>

                                    <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                        <td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Kode</td>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 w-60">Tanggal Jual</th>
                                        <td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Anggota</td>
                                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2 w-60">Jenis Kartu</th>
                                        <td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Jumlah Kartu</td>
                                        <td class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">Total</td>
                                        <th class="text-secondary opacity-7">AKSI</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="j in penjualan" :key="j.id_jual">
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ j.id_jual }}</h6>
                                            </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1 w-60">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ j.tgl_jual }}</h6>
                                            </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1 w-60">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ j.nama }}</h6>
                                            </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1 w-60">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ j.jenis }}</h6>
                                            </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1 w-60">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ j.jml_kartu}}</h6>
                                            </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1 w-60">
                                            <div class="d-flex flex-column justify-content-center">
                                                <h6 class="mb-0 text-sm">{{ j.total}}</h6>
                                            </div>
                                            </div>
                                        </td>

                                        <td class="align-mid_liquiddle">
                                            <v-btn type="button" class="btn btn-sm mb-0 me-1 btn-warning" data-bs-toggle="modal" data-bs-target="#editModal" @click="getDataJualById(j.id_jual)">
                                            Edit
                                            </v-btn>
                                            <v-btn type="button" class="btn btn-sm mb-0 me-1 btn-danger" @click="konfirmasiHapus(j.id_jual)">
                                            Hapus
                                            </v-btn>
                                        </td>
                                        </tr>
                                    </tbody>
                                    </table>
                                </div>
                                <!-- Modal Tambah -->
                                    <div class="modal fade" id="tambahModal" tabindex="-1" aria-labelledby="hapusModalLabel" aria-hid_liquidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                            <h6 class="modal-title" id="exampleModalToggleLabel">Tambah Data Penjualan</h6>
                                            </div>
                                            <form @submit.prevent="tambahJual">
                                            <div class="modal-body">
                                                <div class="mb-3">
                                                    <input class="form-control form-control-sm" type="date" placeholder="Tanggal Penjualan" v-model="newJual.tgl_jual">
                                                    <select class="form-control form-control-sm" v-model="newJual.id_anggota" >
                                                        <option disabled value="" >--Pilih Anggota--</option> 
                                                        <option v-for="a in anggota" :key="a.id_anggota" :value="a.id_anggota">
                                                            {{ a.nama }}
                                                        </option>
                                                    </select>
                                                    <select class="form-control form-control-sm" v-model="newJual.id">
                                                        <option disabled value="">--Pilih Jenis Kartu--</option> 
                                                        <option v-for="k in kartu" :key="k.id" :value="k.id">
                                                            {{ k.jenis }}
                                                        </option>
                                                    </select>
                                                    <input class="form-control form-control-sm" type="text" placeholder="Jumlah Penjualan" v-model="newJual.jml_kartu">
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-sm btn-primary ms-2" data-bs-dismiss="modal">Simpan</button>
                                            </div>
                                            </form>
                                        </div>
                                        </div>
                                    </div>
                                    <!-- Modal Edit -->
                                        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hid_liquidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                <h6 class="modal-title" id="exampleModalToggleLabel">Edit Data Penjualan</h6>
                                                </div>
                                                <form @submit.prevent="update">
                                                <div class="modal-body">
                                                    <div>
                                                        <input class="form-control form-control-sm" type="hidden" v-model="id_jual">
                                                    </div>
                                                    <div class="mb-3">
                                                        <input class="form-control form-control-sm" type="date" placeholder="Tanggal Penjualan" v-model="tgl_jual">
                                                        <select class="form-control form-control-sm" v-model="id_anggota">
                                                            <option disabled value="">--Pilih Anggota--</option> 
                                                            <option v-for="a in anggota" :key="a.id_anggota" :value="a.id_anggota">
                                                                {{ a.nama }}
                                                            </option>
                                                        </select>
                                                        <select class="form-control form-control-sm" v-model="id">
                                                            <option disabled value="">--Pilih Jenis Kartu--</option> 
                                                            <option v-for="k in kartu" :key="k.id" :value="k.id">
                                                                {{ k.jenis }}
                                                            </option>
                                                        </select>
                                                        <input class="form-control form-control-sm" type="text" placeholder="Jumlah Penjualan" v-model="jml_kartu">
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-sm btn-primary ms-2" data-bs-dismiss="modal">Update</button>
                                                </div>
                                                </form>
                                            </div>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
import Vue from 'vue';
import Swal from 'sweetalert2';
import axios from 'axios';
Vue.use(axios);

  export default {
    name: 'DataJual',
    data() {
      return {
        penjualan: [],
        anggota: [],
        kartu: [],
        newJual: {
        tgl_jual: '',
        },
        id_jual: null,
        tgl_jual: '',
        id_anggota: '',
        id: '',
        jml_kartu: '',
      };
    },
    created() {
      this.getDataJual();
      this.getDataAnggota();
      this.getDataKartu();
    },
    methods: {
      getDataJual() {
        axios
          .get('http://localhost:8000/api/getjual')
          .then(response => {
            this.penjualan = response.data;
          })
          .catch(err => {
            console.error(err);
          });
      },

      getDataAnggota() {
        axios
          .get('http://localhost:8000/api/getanggota')
          .then(response => {
            this.anggota = response.data;
          })
          .catch(err => {
            console.error(err);
          });
      },

      getDataKartu() {
        axios
          .get('http://localhost:8000/api/getkartu')
          .then(response => {
            this.kartu = response.data;
          })
          .catch(err => {
            console.error(err);
          });
      },

    tambahJual() {
      axios
        .post('http://localhost:8000/api/create_jual', this.newJual)
        .then(() => {
          this.getDataJual();
          this.newJual = {
            tgl_jual: '',
            id_anggota: '',
            id: '',
            jml_kartu: '',
          };
        })
        .catch((err) => {
          console.log(err);
        });
      },

      konfirmasiHapus(id_jual) {
        const swalWithBootstrapButtons = Swal.mixin({
          customClass: {
            confirmButton: 'btn btn-success ms-2',
            cancelButton: 'btn btn-danger'
          },
          buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
          title: 'Apa anda yakin ?',
          text: "Anda akan kehilangan data ini !",
          icon: 'warning',
          confirmButtonText: 'Ya, hapus!',
          showCancelButton: true,
          reverseButtons: true,
          cancelButtonText: 'Batalkan!'          
        }).then((result) => {
          if (result.isConfirmed) {
            axios.delete('http://localhost:8000/api/delete_jual/'+id_jual)
            .then(() => {
              this.getDataJual();
            })
            swalWithBootstrapButtons.fire(
              'Terhapus !',
              'Data anda telah dihapus.',
              'success'
            )
          } else if (
            /* Read more about handling dismissals below */
            result.dismiss === Swal.DismissReason.cancel
          ) {
            swalWithBootstrapButtons.fire(
              'Dibatalkan',
              'Data anda terselamatkan :)',
              'error'
            )
          }
        })
      },
      getDataJualById(id_jual){
          axios.get('http://127.0.0.1:8000/api/idjual/' + id_jual)
          .then((response) => {
              console.log(response.data[0])
              this.id_jual = response.data[0].id_jual
              this.tgl_jual = response.data[0].tgl_jual
              this.id_anggota = response.data[0].id_anggota
              this.id = response.data[0].id
              this.jml_kartu = response.data[0].jml_kartu
          })
      },
      update : function (){
        let getDataJual= {
            id_jual: this.id_jual,
            tgl_jual : this.tgl_jual,
            id_anggota : this.id_anggota,
            id : this.id,
            jml_kartu : this.jml_kartu,
        }
        axios.put("http://127.0.0.1:8000/api/update_jual/" + this.id_jual , getDataJual)
        .then(() => {
          this.getDataJual();
          Swal.fire(
            'Sukses !',
            'Data Penjualan Berhasil Diupdate.',
            'Success'
          )
        })
      },
    }
  };
  </script>