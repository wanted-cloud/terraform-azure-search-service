module "template" {
    source = "../.."

    name                = "example-aaiss"
    location             = "North Europe"
    resource_group_name = "example-rg"

    skillsets = [
      {
        name        = "2025-05-26-raw-x-title-skillset"
        description = "Skillset to chunk documents and generate embeddings"
        skills = [
          {
            "@odata.type"           = "Microsoft.Skills.Text.SplitSkill",
            name                    = "#1"
            description             = "Split skill to chunk documents"
            context                 = "/document"
            defaultLanguageCode     = "en"
            textSplitMode           = "pages"
            maximumPageLength       = 2000
            //pageOverlapLength       = 500
            //maximumPagesToTake      = 0
            //unit                    = "characters"
            inputs = [
              {
                name   = "text"
                source = "/document/fullText"
                inputs = []
              }
            ]
            outputs = [
              {
                name       = "textItems"
                targetName = "pages"
              }
            ]
          },
          /*{
            name            = "#2"
            context         = "/document/pages/*"
            resourceUri     = "https://gl-oai-swc-wanted-ai-hub-prod-001.openai.azure.com"
            apiKey          = "<redacted>"
            deploymentId    = "text-embedding-ada-002"
            dimensions      = 1536
            modelName       = "text-embedding-ada-002"
            inputs = [
              {
                name   = "text"
                source = "/document/pages/*"
                inputs = []
              }
            ]
            outputs = [
              {
                name       = "embedding"
                targetName = "text_vector"
              }
            ]
          }*/
        ]
        /*index_projections = {
          selectors = [
            {
              targetIndexName      = "2025-05-26-raw-x-title-vector"
              parentKeyFieldName   = "parent_id"
              sourceContext        = "/document/pages/*"
              mappings = [
                { name = "text_vector", source = "/document/pages/*\/text_vector", inputs = [] },
                { name = "chunk", source = "/document/pages/*", inputs = [] },
                { name = "title", source = "/document/title", inputs = [] },
                { name = "id", source = "/document/id", inputs = [] },
                { name = "title_Data_Column", source = "/document/title", inputs = [] },
                { name = "perex", source = "/document/perex", inputs = [] },
                { name = "author", source = "/document/author", inputs = [] },
                { name = "datePublished", source = "/document/datePublished", inputs = [] },
                { name = "articleLink", source = "/document/articleLink", inputs = [] },
                { name = "metadata_storage_content_type", source = "/document/metadata_storage_content_type", inputs = [] },
                { name = "metadata_storage_size", source = "/document/metadata_storage_size", inputs = [] },
                { name = "metadata_storage_last_modified", source = "/document/metadata_storage_last_modified", inputs = [] },
                { name = "metadata_storage_content_md5", source = "/document/metadata_storage_content_md5", inputs = [] },
                { name = "metadata_storage_name", source = "/document/metadata_storage_name", inputs = [] },
                { name = "metadata_storage_path", source = "/document/metadata_storage_path", inputs = [] },
                { name = "metadata_storage_file_extension", source = "/document/metadata_storage_file_extension", inputs = [] }
              ]
            }
          ]
          parameters = {
            projectionMode = "skipIndexingParentDocuments"
          }
        }*/
      }
    ]
}
