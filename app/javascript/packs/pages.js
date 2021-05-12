$(document).ready(function() {
    $('#input-repository-search').keyup(function() {
        const term = $(this).val();
        if (term.length < 3) {
            return;
        }
        getRepositoriesByTerm(term);
    });
    $('#repository-list-container').on('click', '.btn-add-repository', function() {
      const name = $(this).data('name');
      const version = $(this).data('version');
      const description = $(this).data('description');
      const url = $(this).data('url');
      const publisher = $(this).data('publisher');

      $.ajax({
        url: '/repositories',
        type: 'POST',
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        data: {
          repository: {
            name,
            version,
            description,
            url,
            publisher
          }
        }
      }).done(function(response){
        alert('Se agregó correctamente');
      }).fail(function(error){
        console.error(error);
      });
    });
});

function getRepositoriesByTerm(term) {
    const URL = 'https://registry.npmjs.org/-/v1/search?text=';

    // Ajax Call to the API
    $.ajax({
        url: URL + term,
        type: 'GET'
    }).done(function(response) {
        const formattedListHTML = formatListHTML(response);
        $('#repository-list-container').html(formattedListHTML);
    }).fail(function(error) {
        console.error(error);
    });
}

function formatListHTML(data) {
    let listHTML = '';

    data.objects.forEach(function(repository) {
        listHTML += `
        <li class="list-group-item d-flex justify-content-between align-items-center">
          ${repository.package.name}
          <button
            data-name="${repository.package.name}"
            data-version="${repository.package.version}"
            data-description="${repository.package.description}"
            data-url="${repository.package.links.npm}"
            data-publisher="${repository.package.publisher.username}"
            class="btn btn-primary btn-add-repository"
          >Agregar</button>
        </li>
        `;
    });

    return listHTML;
}
