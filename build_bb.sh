 scripts=(                                          
    hn_Nhsqc.fid/hsqc.com         
    hnca3d.fid/hnca.com           
    hncoca3d.fid/hncoca.com  
    hncacb3d.fid/hncacb.com       
    hncb3d.fid/hncb.com 
    hncocb3d.fid/hncocb.com
    cbcaconh3d.fid/cbcaconh.com 
    hncaco3d.fid/hncaco.com                 
    hnco3d.fid/hnco.com                               
)

directories=()
for script in ${scripts[@]}       
do
    path=$( echo ${script%/*} )
    path_root=$( echo "${path%.*}")
    filename=$( echo ${script##*/} )
    filename_root=$( echo "${filename%.*}")
    directories+=( $path )
    cd "$path" 
    csh "$filename" 
    cd ..
    tar --exclude=.DS_Store -zcvf ${path_root}.tgz $path
    
done
tar --exclude=.DS_Store -zcvf archive-1.tgz ${directories[@]}