# Variabel Array global untuk menyimpan atau menampung data (untuk menjadikan variabel global berikan tanda $ paaa awal nama Variabel)
$kamar = []
$status = []
$tgl_pemesanan = []

# fungsi untuk menampilkan semua booking kamar
def show_data
    if $kamar.length() <= 0
        puts "data kosong"
    else
        indexs = 0
        $kamar.each do |n|
            puts "#{indexs + 1} | kamar : #{$kamar[indexs]} | status : #{$status[indexs]}"  
            indexs += 1      
        end
    end
end

# fungsi untuk menampilkan tanggal transaksi
def show_transaction
    if $kamar.length() <= 0
        puts "data kosong"
    else
        indexs = 0
        $kamar.each do |n|
            puts "#{indexs + 1} | kamar : #{$kamar[indexs]} | Tanggal Pemesanan : #{$tgl_pemesanan[indexs]}"  
            indexs += 1      
        end
    end
end

# fungsi untuk menambah pemesanan kamar hotel
def insert_data
    puts "\t=========== Pesanan kursi ===========\n\n"
    puts "Contoh Kode kamar [101,201,301,401,501] angka ke-1 = lantai angka selanjutnya adalah no.kamar\n\n"

    print "Masukan Nomor Kamar : "
    room_booking = gets.chomp.to_i
    print "Masukan Status Kamar [free/book] : "
    room_status = gets.chomp
    $kamar.append(room_booking)
    $status.append(room_status)
    tgl = Time.now
    $tgl_pemesanan.append(tgl)
end

# fungsi untuk menghapus atau membatalkan pesanan kamar
def cancel_data
    show_data
    print "\n\nMasukan nomor urutan untuk membatalkan pemesanan: "
    indexs = gets.chomp.to_i
    indexs -= 1
    if indexs >= $kamar.length
        print "kamar yang anda pilih belum dibooking"
    else
        $kamar.delete_at(indexs)
        $status.delete_at(indexs)
        $tgl_pemesanan.delete_at(indexs)
        # puts "#{$kamar[indexs]}"
    end
end

# fungsi untuk mengubah data pemesanan kamar hotel
def edit_data
    show_data
    print "\n\nMasukan nomor urutan untuk mengubah data pemesanan: "
    indexs = gets.chomp.to_i
    indexs -= 1
    if indexs >= $kamar.length
        print "kamar yang anda pilih belum dibooking"
    else
        print "Masukan Nomor Kamar: "
        booking_ubah = gets.chomp.to_i
        print "Masukan Status kamar: "
        status_ubah = gets.chomp
        $kamar[indexs] = booking_ubah
        $status[indexs] = status_ubah
    end
end

# fungsi untuk menampilkan menu
def show_menu
    puts "\n\n"
    puts "=========== Selamat Datang FHIZYEL HOTELS, Silahkan masukan pemesanan booking kamar ============\n\n"

    puts "\t\t\t============= Pilih Menu ==============\n\n"
    puts "[1] Pemesanan kamar --> book_room"
    puts "[2] Batalkan Pesanan --> cancel_room"
    puts "[3] Edit Pesanan kamar --> edit_room"
    puts "[4] Laporan Status Booking --> room_status"
    puts "[5] Laporan Transaksi Hotel --> transaction_status"
    puts "[6] Keluar Aplikasi --> exit"

    print "\n\nMASUKAN MENU : "
    # menu = Integer(gets.chomp)
    menu = gets.chomp.to_i

    case menu
    when 1
        insert_data
        puts "\n"
        next_showMenu
    when 2
        cancel_data
        puts "\n"
        next_showMenu
    when 3
        edit_data
        puts "\n"
        next_showMenu
    when 4
        show_data
        puts "\n"
        next_showMenu
    when 5
        show_transaction
        puts "\n"
        next_showMenu
    when 6
        exit(true)
    else
        puts "Maaf Pilihan Menu anda tidak tersedia, Silahkan coba lagi." 
        next_showMenu 
    end
end

# fungsi menentukan pilihan untuk lanjut ke menu utama atau tidak
def next_showMenu
    print "Apakah Ingin Lanjut?[Y/N]: "
        lanjut = gets.chomp
        
        case lanjut
        when "y" , "Y"
            system("clear")
            # system("cls") /untuk windows
            show_menu
        when "n" , "N"
            exit(true)
        else
            system("clear")
            # system("cls") /untuk windows
            next_showMenu
        end
end

# pemanggilan Show Menu
show_menu
